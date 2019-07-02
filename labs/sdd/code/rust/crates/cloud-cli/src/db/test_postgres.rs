use futures::{ Future, Stream };
use tokio_postgres::{connect, NoTls};

pub fn test_postgres() {
    let fut =
        // Connect to the database
        connect(super::PG_CONNECTION, NoTls)

        // The connection object performs the actual communication with the
        // database, so spawn it off to run on its own.
        .map(|(client, connection)| {
            let connection = connection
                .map_err(|e| eprintln!("connection error: {}", e))
            ;

            tokio::spawn(connection);

            // The client is what I use to make requests.
            client
        })

        // Now I can prepare a simple statement that just returns its parameter.
        .and_then(|mut client| {
            client
                .prepare("SELECT $1::TEXT")
                .map(|statement| (client, statement))
        })

        // And then execute it, returning a Stream of Rows which we collect
        // into a Vec.
        .and_then(|(mut client, statement)| {
            client
                .query(&statement, &[&"hello world"])
                .collect()
        })

        // Now we can check that we got back the same string we sent over.
        .map(|rows| {
            let value: &str = rows[0].get(0);
            assert_eq!(value, "hello world");
            
            println!("Result: \"{}\"", value);
        })

        // And report any errors that happened.
        .map_err(|e| {
            eprintln!("error: {}", e);
        })
    ;

    // By default, tokio_postgres uses the tokio crate as its runtime.
    println!("Starting...");
    tokio::run(fut);
    println!("Started");
}
