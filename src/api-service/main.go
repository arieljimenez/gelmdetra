package main

import (
	"github.com/frismaury/gelmdetra/src/api-service/config"
	"github.com/frismaury/gelmdetra/src/api-service/manager"
)

func main() {
	app := manager.App{}
	config := config.GetConfig()

	app.Initialize(config)

	app.Run(":8000")
}
