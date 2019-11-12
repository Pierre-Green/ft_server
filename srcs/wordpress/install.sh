#!/usr/bin/env bash

# Templating wp-config.php
TEMPLATE=$(<wp-config.php.template)

# Import salts
SALTS="$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)"
TEMPLATE="${TEMPLATE/SALTS_PLACEHOLDER/$SALTS}"

# Set db infos
TEMPLATE="${TEMPLATE/PDB_NAME/$DB_NAME}"
TEMPLATE="${TEMPLATE/PDB_USER/$DB_USER}"
TEMPLATE="${TEMPLATE/PDB_PASS/$DB_PASS}"
TEMPLATE="${TEMPLATE/PDB_HOST/$DB_HOST}"

# Save wp-config.sh
echo "$TEMPLATE" > wp-config.php
