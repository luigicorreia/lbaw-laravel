#!/bin/bash
# Install and run postgres locally
docker build -t lbaw .
docker run --name lbaw -p 5432:5432 -v pgdata:/var/lib/postgresql/data -d lbaw

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
  docker stop lbaw
  docker rm lbaw
}

# Ensure laravel and dependencies are installed. Requires composer
composer global require "laravel/installer"
cd laravel
composer install
php artisan serve

docker stop lbaw
docker rm lbaw
