use std::fmt;
use futures::{ Future };
use tokio_postgres::{ Client };

pub struct SqlConnection<'a> {
    pub server: &'a str,
    pub port: u16,
    pub database: &'a str,
    pub user: &'a str,
    pub password: &'a str
}

impl<'a> fmt::Display for SqlConnection<'a> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(
            f,
            "server={} port={} database={} user={} password={}",
            self.server,
            self.port,
            self.database,
            self.user,
            self.password
        )
    }
}

pub const DEFAULT_PG: SqlConnection = SqlConnection {
    server: "localhost",
    port: 5432,
    database: "postgres",
    user: "postgres",
    password: ""
};

pub struct SqlPipeline {
    client: Client
}

pub trait SqlPipe {
    fn execute(pipeline: &SqlPipeline) -> Box<Future<Item = SqlPipeline, Error = ()>>;
}

impl<'a> SqlPipe for SqlConnection<'a> {
    fn execute(pipeline: &SqlPipeline) -> Box<Future<Item = SqlPipeline, Error = ()>> {
        unimplemented!();
    }
}
