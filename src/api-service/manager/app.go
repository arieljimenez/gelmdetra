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

func (a *App) Initialize(config *config.Config) {
	dbURI := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=True&loc=Local",
		config.DB.Username,
		config.DB.Password,
		config.DB.Dialect,
		config.DB.Port,
		config.DB.DBName,
		config.DB.Charset)

	db, err := gorm.Open(config.DB.Dialect, dbURI)

	if err != nil {
		log.Fatal("Could not connect database")
	} else {
		log.Printf("======================")
		log.Printf("= Database connected =")
		log.Printf("======================")
	}

	a.Router = NewRouter(db)
}

func (a *App) Run(addr string) {
	log.Fatal(http.ListenAndServe(addr, a.Router))
}
