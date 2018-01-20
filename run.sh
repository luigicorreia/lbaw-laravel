#!/bin/bash
# Ensure laravel and dependencies are installed. Requires composer
composer global require "laravel/installer"
cd laravel-demo && composer install && cd ..

# Install and run postgres locally
docker build -t lbaw .
docker run -p 5432:5432 -v pgdata:/var/lib/postgresql/data lbaw
