package manager

import (
	"net/http"

	"github.com/frismaury/gelmdetra/src/api-service/entities/root"
	"github.com/gorilla/mux"
	"github.com/jinzhu/gorm"
)

type Route struct {
	Name    string
	Method  string
	Pattern string
	Handler http.Handler
}

type Routes []Route

func NewRouter(db *gorm.DB) *mux.Router {
	router := mux.NewRouter().StrictSlash(true)
	routes := getRoutes(db)
	for _, route := range routes {
		router.
			Methods(route.Method).
			Path(route.Pattern).
			Name(route.Name).
			Handler(route.Handler)
	}

	return router
}

func getRoutes(db *gorm.DB) Routes {
	var routes = Routes{
		Route{
			"Homepage",
			"GET",
			"/",
			root.HandlerRoot(),
		}}

	return routes
}
