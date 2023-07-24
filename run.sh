#!/bin/bash

CONFIG_TMP_FILE="config/config.tmp.sh"
CONFIG_FILE="config/config.sh"

if [ ! -f "$CONFIG_TMP_FILE" ]; then
    echo "Error: Config file $CONFIG_TMP_FILE not found."
    exit 1
else

    MY_IPV4=$(ip -4 addr | grep inet | grep -v 127.0.0.1 | awk '{print $2}' | cut -d "/" -f 1 | head -n 1)
    echo "My IPv4 address: $MY_IPV4"
    sed -e "s/{MY_IPV4}/$MY_IPV4/g" $CONFIG_TMP_FILE >$CONFIG_FILE
    source $CONFIG_FILE
fi

# Check is docker installed

if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker is not installed.' >&2
    exit 1
fi

# Check is docker daemon running

if ! docker info >/dev/null 2>&1; then
    echo 'Error: docker daemon is not running.' >&2
    exit 1
fi

# Check is docker-compose installed

COMPOSE_CMD="docker-compose"

if ! [ -x "$(command -v docker-compose)" ]; then
    compose_version=$(docker compose version --short)
    if [ -z "$compose_version" ]; then
        echo 'Error: docker-compose is not installed.' >&2
        exit 1
    fi
    COMPOSE_CMD="docker compose"
fi

command=(up down config)
if [[ ! " ${command[@]} " =~ " ${1} " ]]; then
    echo "Usage: $0 {up|down}"
    exit 1
fi

case=$1
case $case in
up)
    echo "Starting containers..."
    $COMPOSE_CMD --env-file $CONFIG_FILE up -d
    ;;
down)
    echo "Stopping containers..."
    $COMPOSE_CMD --env-file $CONFIG_FILE down
    ;;
config)
    echo "Generating config files..."
    $COMPOSE_CMD --env-file $CONFIG_FILE config
    ;;
esac
