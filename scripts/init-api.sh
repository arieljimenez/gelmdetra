#!/bin/ash

sleep 10 && \
  go run gelmdetra/migrations/main.go && \
  watcher --run github.com/frismaury/gelmdetra/src/api-service
