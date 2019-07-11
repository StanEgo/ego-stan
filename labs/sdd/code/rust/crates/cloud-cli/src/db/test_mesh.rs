use futures::{ Future, Stream };
use tokio_postgres::{connect, NoTls};
use std::{ fs::read_to_string };

use crate::db::sql::{ SqlConnection, DEFAULT_PG };

fn test_mesh_script(sql_script: &'static str) {
    let fut = connect(super::PG_CONNECTION, NoTls)
        .and_then(move |(mut client, connection)| {
            let connection = connection
                .map_err(|e| eprintln!("connection error: {}", e))
            ;

            tokio::spawn(connection);

            let path_to_sql = format!("{}{}", super::PG_SCRIPTS_FOLDER, sql_script);
            let sql = &read_to_string(&path_to_sql).unwrap();

            println!("MESH: Deploying {}", sql_script);

            client.simple_query(&sql).collect()
        })
        .map(|_| {
            println!("MESH: Schema deployed");
        })
        .map_err(|e| {
            eprintln!("error: {}", e);
        })
    ;

    tokio::run(fut);
}

static PG_FILES: &'static [&'static str] = &[
    "/clean.sql"
];

pub fn test_mesh() {
    //TASK:test_mesh_script(PG_FILES[0]);

    let connection = SqlConnection {
        password: "!qa2Ws3eD",
        ..DEFAULT_PG
    };

    println!("Connection: {}", connection);
}
