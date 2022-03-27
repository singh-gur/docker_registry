#!/bin/bash

MODE="${1:-simple}"
USER="${2:-repouser}"
PASS="${3:-repopass}"
echo $MODE
pushd $MODE
[ ! -d data ] && mkdir data
[ $MODE == "secure" ] && htpasswd -bcB htpasswd $USER $PASS
docker-compose up -d
popd