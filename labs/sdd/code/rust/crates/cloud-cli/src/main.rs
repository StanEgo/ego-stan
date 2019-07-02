use clap::{ App, AppSettings };

mod db;

const CLI_NAME: &'static str = env!("CARGO_PKG_NAME");
const CLI_VERSION: &'static str = env!("CARGO_PKG_VERSION");
const CLI_AUTHORS: &'static str = env!("CARGO_PKG_AUTHORS");

fn test_clap() {
    let cli = App
        ::new(CLI_NAME)
        .version(CLI_VERSION)
        .author(CLI_AUTHORS)
        .setting(AppSettings::ArgRequiredElseHelp)

        .subcommand(db::command_factory())
        .get_matches()
    ;

    match cli.subcommand() {
        (db::COMMAND_NAME, Some(db_args)) => {
            match db_args.subcommand() {
                ("test-postgres", Some(_)) => db::test_postgres(),
                ("test-mesh", Some(_)) => db::test_mesh(),
                _ => unimplemented!()
            }
        },
        _ => unimplemented!()
    }
}

fn main() {
    test_clap();
}
