use rusqlite::{params, Connection, Result};

use crate::entity::person::Person;

// #[derive(Debug)]
// struct Person {
//     id: i32,
//     name: String,
// }

// pub fn sql_print(){
//     println!("Hello from sql_handler");
// }

pub fn read_sql() -> Vec<Person> {
    const DB_PATH: &str = "./test.db";
    let conn = Connection::open(DB_PATH).unwrap();

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