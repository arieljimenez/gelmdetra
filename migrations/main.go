package main

import (
	"fmt"
	"log"

	"github.com/frismaury/gelmdetra/src/api-service/config"

	"github.com/frismaury/gelmdetra/src/api-service/entities/user"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

func main() {
	config := config.GetConfig()
	dbURI := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=True&loc=Local",
		config.DB.Username,
		config.DB.Password,
		config.DB.Dialect,
		config.DB.Port,
		config.DB.DBName,
		config.DB.Charset)

	if db, err := gorm.Open(config.DB.Dialect, dbURI); err != nil {
		log.Fatal("Could not connect database")
	} else {
		if !db.HasTable(user.User{}) {
			log.Printf("=======================")
			log.Printf("= Updating DB schemas =")
			log.Printf("=======================")
			db.CreateTable(user.User{})
			db.AutoMigrate(user.User{})
		}
	}
}
