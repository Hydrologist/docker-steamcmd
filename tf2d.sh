#!/bin/bash

usage="$(basename "$0") [-h] [-i] [-p <0:65535>] [-d <string>] [server arguments] starts a Docker container running a Team Fortress 2 server with the provided arguments

where:
  -h show this help text
  -i run the container in interactive mode (default: false)
  -p the host port whose traffic should be directed to the container (default: 27015)
  -d the directory to be used to override the tf folder (default: current working directory)"

PORT=27015
DIR=$(readlink -f .)
TYPE=d

while getopts ':hip:d:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    i) TYPE=i
       ;;
    p) PORT=$OPTARG
       ;;
    d) DIR=$(readlink -f $OPTARG)
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

echo "USING PORT $PORT"
echo "OVERRIDING TF WITH $DIR"

docker run -${TYPE}t -p $PORT:27015/tcp -p $PORT:27015/udp -v $DIR:/opt/tf2 steamcmd-tf2:latest $@:2
