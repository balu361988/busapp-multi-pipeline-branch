#!/bin/bash

version=prod

docker build -t balu361988/busapp:${version} .
docker push balu361988/busapp:${version}
