#!/bin/bash

MODE=simple
USER=repouser
PASS=repopass

usage()
{
cat << EOF
usage: ./setup.sh (-param=value)
-m, --mode (default: simple) (options: simple,secure)
-u, --user (default: repouser) only needed for secure mode
-p, --pass (default: repopass) only needed for secure mode
-h, --help
EOF
}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -m | --mode )
            MODE=$VALUE
        ;;
        -u | --user )
            USER=$VALUE
        ;;
        -p | --pass )
            PASS=$VALUE
        ;;
        -h | --help )    usage
            exit
    esac
    shift
done

pushd $MODE
[ ! -d data ] && mkdir data
[ $MODE == "secure" ] && htpasswd -bcB htpasswd $USER $PASS
docker-compose up -d
popd