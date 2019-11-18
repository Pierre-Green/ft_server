#!/usr/bin/env bash

export DB_NAME=wordpress
export DB_USER=root
export DB_PASS=password
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
