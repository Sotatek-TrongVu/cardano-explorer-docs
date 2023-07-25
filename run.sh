#!/bin/bash
CONFIG_TMP_FILE="config/config.tmp.sh"
CONFIG_FILE="config/config.sh"
NETWORKS=("mainnet" "preprod" "preview")
Help() {
    # Display Help
    echo "Run explorer"
    echo
    echo "Syntax: $0 {help|up|down|config|pull}"
    echo "options:"
    echo "up <network>     Run explorer"
    echo "down <network>   Stop explorer"
    echo "config <network> Generate config file"
    echo "pull <network>   Pull images"
    echo "help             Print this Help."
    echo
}

Get_network_magic() {
    case $NETWORK in
    mainnet)
        echo 764824073
        ;;
    preprod)
        echo 1
        ;;
    preview)
        echo 2
        ;;
    esac
}

Setup() {
    if [ ! -f "$CONFIG_TMP_FILE" ]; then
        echo "Error: Config file $CONFIG_TMP_FILE not found."
        exit 1
    fi

    echo "Network: ${1}"
    NETWORK=${1}
    if [[ ! " ${NETWORKS[@]} " =~ " ${NETWORK} " ]]; then
        echo "Error: Invalid network"
        echo "Networks: ${NETWORKS[*]}"
        exit 1
    fi
    NETWORK_MAGIC=$(Get_network_magic)
    echo "Network magic: $NETWORK_MAGIC"

    MY_IPV4=$(ip -4 addr | grep inet | grep -v 127.0.0.1 | awk '{print $2}' | cut -d "/" -f 1 | head -n 1)
    echo "My IPv4 address: $MY_IPV4"
    # sed multiline
    sed -e "s/{MY_IPV4}/$MY_IPV4/g" -e "s/{NETWORK_MAGIC}/$NETWORK_MAGIC/g" -e "s/{NETWORK}/$NETWORK/g" $CONFIG_TMP_FILE >$CONFIG_FILE

    source $CONFIG_FILE

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
}

case $1 in
help) # display
    Help
    exit
    ;;
*)
    command=(help up down config pull)
    if [[ ! " ${command[@]} " =~ " ${1} " ]]; then
        echo "Usage: $0 {help|up|down|config|pull}"
        exit 1
    fi
    Setup $2
    case $1 in
    up)
        $COMPOSE_CMD --env-file $CONFIG_FILE up -d
        ;;
    down)
        $COMPOSE_CMD --env-file $CONFIG_FILE down
        ;;
    config)
        $COMPOSE_CMD --env-file $CONFIG_FILE config
        ;;
    pull)
        $COMPOSE_CMD --env-file $CONFIG_FILE pull
        ;;
    esac
    ;;
esac
