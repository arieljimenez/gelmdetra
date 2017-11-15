#!/bin/bash

docker-compose up --remove-orphans

# DEPRECATED
# ctx=`docker ps -aqf name=gedetrax`
# if [ -z $ctx ]; then
#   echo "================================"
#   echo "[Creating container for DEV ENV]"

#   docker run -it \
#     --name gedetrax \
#     -p 8000:8000 -p 8080:8080 \
#     -v ${PWD}:/app \
#     frismaury/gelmdetra:v1
# else
#   echo "============================"
#   echo "[Running gELMdetra container]"
#   docker start -i gedetrax
# fi
