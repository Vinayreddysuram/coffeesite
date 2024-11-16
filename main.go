package main

import (
	"log"
	"net/http"
)

func main() {
	// Serve the static files (HTML, CSS, JS, and images)
	fs := http.FileServer(http.Dir("./static"))
	http.Handle("/", fs)

	// Log the server start message
	log.Println("Server started on http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
