package manager

import (
	"fmt"
	"log"
	"net/http"

	"github.com/frismaury/gelmdetra/src/api-service/config"
	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"github.com/jinzhu/gorm"
)

type App struct {
	Router *mux.Router
	DB     *gorm.DB
}

// "%s:%s@tcp(localhost:%s)/%s?charset=utf8&parseTime=True&loc=Local"
func (a *App) Initialize(config *config.Config) {
	dbURI := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=True&loc=Local",
		config.DB.Username,
		config.DB.Password,
		config.DB.Dialect,
		config.DB.Port,
		config.DB.DBName,
		config.DB.Charset)

	if _, err := gorm.Open(config.DB.Dialect, dbURI); err != nil {
		log.Fatal("Could not connect database")
	} else {
		log.Printf("Database connected")
	}

	// a.DB = model.DBMigrate(db)
	a.Router = NewRouter(a.DB)
}

func (a *App) Run(addr string) {
	log.Fatal(http.ListenAndServe(addr, a.Router))
}
