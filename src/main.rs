use arboard::Clipboard;
use std::io::{self, Read};

fn main() {
    let mut buffer = String::new();
    if let Err(e) = io::stdin().read_to_string(&mut buffer) {
        eprintln!("Failed to read from stdin: {}", e);
        std::process::exit(1);
    }

    match Clipboard::new() {
        Ok(mut ctx) => {
            if let Err(e) = ctx.set_text(buffer) {
                eprintln!("Failed to copy to clipboard: {}", e);
                std::process::exit(1);
            }
            println!("copied");
            std::thread::sleep(std::time::Duration::from_millis(50));
        }
        Err(e) => {
            eprintln!("Failed to initialize clipboard: {}", e);
            std::process::exit(1);
        }
    }
}
