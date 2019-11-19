#!/usr/bin/env bash

export DB_NAME=wordpress
export DB_USER=wordpress
export DB_PASS="$(openssl rand -base64 16)"
export DB_HOST=localhost

export WORDPRESS_LOCATION=/var/www/html/wordpress

chmod +x **/*.sh

./dependencies.sh

declare -a modules=("nginx" "mysql" "php" "phpmyadmin" "wordpress")

for module in "${modules[@]}"
do
cd $module
./install.sh
cd ..
done
