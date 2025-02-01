package handlers

import (
	"fmt"
	"net/http"
)

func Handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, World!")
}

func SetMessage(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "SetMessage")
}

func GetMessage(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "GetMessage")
}