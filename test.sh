#!/bin/bash

# https://stackoverflow.com/questions/50561553/how-can-i-determine-the-current-config-of-php-fpm

source $(dirname "$0")/init.sh
docker exec -it php-docker-php80-1 php-fpm8.0 -tt
