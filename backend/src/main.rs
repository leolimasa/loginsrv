fn main() {
    println!("Hello, world!");
}

// API
//
// /send_code?email=[email]
// Sends a code to an email (if the email is valid)
// 
// /login/email?email=[email]&code=[code]
// Authenticates a one time code against email. If valid, returns a JWT token as a HttpOnly cookie.
//
// /refresh
// Retrieves another JWT token with fresh expiration date
