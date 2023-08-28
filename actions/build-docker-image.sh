#!/bin/bash

docker login --username $1 --password $2
docker build -t drunkendog/standard-build-actions .
docker push drunkendog/standard-build-actions 