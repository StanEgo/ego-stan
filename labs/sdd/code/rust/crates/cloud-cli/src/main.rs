use clap::{ App, AppSettings, Arg, SubCommand };

mod db;

fn main() {
    db::test_postgres();
}
