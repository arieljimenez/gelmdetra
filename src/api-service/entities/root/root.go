package root

import (
	"fmt"
	"net/http"
)

func HandlerRoot() http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
		// w = utils.SetContentToJSON(w)
		// json.NewEncoder(w).Encode("gELMdetra API")
		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "gELMdetra API")
	})
}
