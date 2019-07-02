use clap::{ App, AppSettings, SubCommand };

mod test_postgres;

pub use self::test_postgres::test_postgres;

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
}
