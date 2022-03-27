#!/bin/bash

MODE="${1:-simple}"

echo $MODE
pushd $MODE
# pwd
[ ! -d data ] && mkdir data
docker-compose up -d
popd