package utils

import (
	"net/http"
	"golang.org/x/crypto/bcrypt"
)

func SetContentToJSON(w http.ResponseWriter) http.ResponseWriter {
	w.Header().Set("Content-Type", "application/json")
	return w
}

func HashPassword(userpassword string) string {
	hash, _ := bcrypt.GenerateFromPassword([]byte(userpassword), bcrypt.DefaultCost)
	return string(hash)
}
