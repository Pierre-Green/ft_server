#!/usr/bin/env bash

export DB_NAME=wordpress
export DB_USER=root
export DB_PASS=password
export DB_HOST=localhost

./dependencies.sh

./nginx.sh
./mysql.sh
./php.sh
./phpmyadmin.sh
./wordpress.sh
