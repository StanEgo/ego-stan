import { Pool } from "pg";
import { strict } from "assert";

// TODO:4SDE/node + generic support
const config = (name: string, defaultValue?: string): string => {
    const path = `npm_package_config_${name.replace('.', '_')}`;
    const value = process.env[path];
    return value === undefined ? defaultValue : value;
    //TODO:If no defaultValue and value is undefined? Exception?
}

const pool = new Pool({
    user: config("pg.user", "postgres"),
    host: config("pg.host", "localhost"),
    database: config("pg.database", "postgres"),
    password: config("pg.password")
});

pool.query('SELECT * from ', (err, res) => {
    console.log(err, res);
    pool.end();
});

// const url = process.env.npm_package_config_pg_url;
// const client = new Client(url);

// client
//     .connect()
//     .then(() => {
//         console.info("Connected.");
//     })
//     .catch(error => console.error(error))
// ;

/*
client.connect(pgUrl, (err, client) => {
  if (err) {
    console.log(err);
  }

  // Listen for all pg_notify channel messages
  client.on('notification', function(msg) {
    // let payload = JSON.parse(msg.payload);
    // dbEventEmitter.emit(msg.channel, payload);
    console.log(msg);
  });
  
  // Designate which channels we are listening on. Add additional channels with multiple lines.
  client.query('LISTEN new_order');
});
*/
