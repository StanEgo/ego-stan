use clap::{ App, AppSettings, SubCommand };

mod sql;
mod test_postgres;
mod test_mesh;

pub use self::test_postgres::test_postgres;
pub use self::test_mesh::test_mesh;

pub static PG_SCRIPTS_FOLDER: &'static str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/mesh"
);

pub const PG_CONNECTION: &str = "postgresql://postgres:!qa2Ws3eD@localhost:5432";
pub const COMMAND_NAME: &str = "db";

pub fn command_factory<'a, 'b>() -> App<'a, 'b> {
    SubCommand
        ::with_name(COMMAND_NAME)
        .about("DB experiments")
        .setting(AppSettings::ArgRequiredElseHelp)
        .subcommand(SubCommand
            ::with_name("test-postgres")
            .about("Test Postgres communication")
        )
        .subcommand(SubCommand
            ::with_name("test-mesh")
            .about("Test the Mesh schema")
        )
}
