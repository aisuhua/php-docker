#!/bin/bash

# https://github.com/docker-library/php/issues/399#issuecomment-289848821

source ./init.sh
docker exec -it php-docker-php80-1 kill -USR2 1
