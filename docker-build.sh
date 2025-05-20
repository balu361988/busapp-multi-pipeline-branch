#!/bin/bash

version=master

docker build -t learnitguide/busapp:${version} .
docker push learnitguide/busapp:${version}
