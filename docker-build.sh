#!/bin/bash

version=master

docker build -t balu361988/busapp:${version} .
docker push balu361988/busapp:${version}
