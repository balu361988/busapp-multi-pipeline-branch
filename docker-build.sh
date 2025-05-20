#!/bin/bash

version=master

sudo docker build -t learnitguide/busapp:${version} .
sudo docker push learnitguide/busapp:${version}
