use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};

mod entity;
mod handler;
use handler::sql_handler;


#[get("/")]
async fn hello() -> impl Responder {
    let persons = sql_handler::read_sql();
    let persons_json_string = serde_json::to_string(&persons).unwrap();

    HttpResponse::Ok()
        .content_type("aplication/json")
        .body(persons_json_string)
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok()
    .content_type("application/json")
    .body(req_body)
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().body("Hey there!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(echo)
            .route("/hey", web::get().to(manual_hello))
    })
    .bind(("127.0.0.1", 4444))?
    .run()
    .await
}


