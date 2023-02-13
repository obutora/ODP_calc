use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Debug)]
pub struct Person {
    id: i32,
    name: String,
}

impl Person {
    pub fn new(id: i32, name: String) -> Person {
        Person {
            id,
            name,
        }
    }
} 