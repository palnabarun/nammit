package main

import (
	"fmt"
	"net/http"
    "time"
    "math/rand"
)

func init() {
    rand.Seed(time.Now().Unix())
}

func getName(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "%s\n", GetRandomName())
}

func main() {
	http.HandleFunc("/", getName)

	http.ListenAndServe(":5000", nil)
}
