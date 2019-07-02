use futures::{ Future, Stream };
use tokio_postgres::{connect, NoTls};

const SQL: &str = include_str!("mesh/db.sql");

pub fn test_mesh() {
    let fut = connect(super::PG_CONNECTION, NoTls)
        .and_then(|(mut client, connection)| {
            let connection = connection
                .map_err(|e| eprintln!("connection error: {}", e))
            ;

            tokio::spawn(connection);

            client.simple_query(SQL).collect()
        })
        .map(|_| {
            println!("MESH: Schema deployed");
        })
        .map_err(|e| {
            eprintln!("error: {}", e);
        })
    ;

    tokio::run(fut);

    // let fut =
    //     connect(super::PG_CONNECTION, NoTls)

    //     // .map(|(client, connection)| {
    //     //     let connection = connection
    //     //         .map_err(|e| eprintln!("connection error: {}", e))
    //     //     ;

    //     //     tokio::spawn(connection);

    //     //     client
    //     // })

    //     // .and_then(|mut client| {
    //     //     client
    //     //         .prepare(SQL)
    //     //         .map(|statement| (client, statement))
    //     // })

    //     // .and_then(|(mut client, statement)| {
    //     //     client
    //     //         .execute(&statement, &[])
    //     // })

    //     // .map(|rows| {
    //     //     println!("Rows affected: \"{}\"", rows);
    //     // })

    //     .map_err(|e| {
    //         eprintln!("error: {}", e);
    //     })
    // ;

    // // By default, tokio_postgres uses the tokio crate as its runtime.
    // println!("Starting...");
    // tokio::run(fut);
}
