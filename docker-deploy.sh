#!/bin/bash

version=dev
env="dev"

if sudo docker ps -a --format '{{.Names}}' | grep "${env}"
then
sudo docker stop ${env} && sudo docker rm ${env}
fi
sudo docker run -it -d -p 8000:8001 --name ${env} balu361988/busapp:${version}
