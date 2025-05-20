#!/bin/bash

version=dev

sudo docker build -t balu361988/busapp:${version} .
sudo docker push balu361988/busapp:${version}
