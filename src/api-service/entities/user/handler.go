package user

import (
	"encoding/json"
	"net/http"

	"github.com/frismaury/gelmdetra/src/api-service/utils"
	"github.com/jinzhu/gorm"
)

func HandlerGetUsers(db *gorm.DB) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
		w = utils.SetContentToJSON(w)
		w.Header().Set("Content-Type", "text/html; charset=utf-8")
		w.Header().Set("Access-Control-Allow-Origin", "*")

		users := getUsers(db)
		json.NewEncoder(w).Encode(users)
	})
}
