use rusqlite::{params, Connection, Result};
use crate::entity::person::Person;

const IS_IN_MEMORY: bool = true;
const DB_PATH: &str = "./test.db";

fn get_connection() -> Connection {
    if IS_IN_MEMORY {
        let conn = Connection::open_in_memory().unwrap();
        conn
    } else {
        let conn = Connection::open(DB_PATH).unwrap();
        conn
    }
}

pub fn init_sql(conn :&Connection) {
    // let conn = get_connection();

    if IS_IN_MEMORY {
        conn.execute(
            "CREATE TABLE IF NOT EXISTS PERSON (
                      id              INTEGER PRIMARY KEY AUTOINCREMENT,
                      name            TEXT NOT NULL
                      )",
            (),
        ).unwrap();

        conn.execute(
            "INSERT INTO PERSON (name) VALUES (?1)",
            params!["In Memory"],
        ).unwrap();
    
    }
}


pub fn read_sql() -> Vec<Person> {
    let conn = get_connection();
    init_sql(&conn);

    let mut result = conn.prepare("SELECT * FROM PERSON").unwrap();

    let persons = result.query_map([], |row| {
        Ok(
            Person::new(row.get(0).unwrap(), row.get(1).unwrap())
        )
    }).unwrap();

    let mut persons_vec: Vec<Person> = Vec::new();

    for person in persons {
        // println!("Found person {:?}", person.unwrap());
        persons_vec.push(person.unwrap());
    }

    return persons_vec;
}