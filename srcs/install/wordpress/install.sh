#!/usr/bin/env bash

TAR_URL="https://wordpress.org/latest.tar.gz"
TAR_FILE="wordpress.tar.gz"

curl $TAR_URL -o $TAR_FILE
tar -xvf $TAR_FILE
rm $TAR_FILE
mv wordpress $WORDPRESS_LOCATION

# Templating wp-config.php
TEMPLATE=$(<wp-config.php)

# Import salts
SALTS="$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)"
TEMPLATE="${TEMPLATE/SALTS_PLACEHOLDER/$SALTS}"

# Set db infos
TEMPLATE="${TEMPLATE/PDB_NAME/$DB_NAME}"
TEMPLATE="${TEMPLATE/PDB_USER/$DB_USER}"
TEMPLATE="${TEMPLATE/PDB_PASS/$DB_PASS}"
TEMPLATE="${TEMPLATE/PDB_HOST/$DB_HOST}"

# Save wp-config.sh
echo "$TEMPLATE" > $WORDPRESS_LOCATION/wp-config.php

echo "CREATE DATABASE $DB_NAME;" | mysql
echo "CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASS';" | mysql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
