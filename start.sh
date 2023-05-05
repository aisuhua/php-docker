#!/bin/bash

source ./init.sh

docker-compose --env-file $ENV_FILE up -d
