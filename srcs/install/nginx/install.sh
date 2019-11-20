#!/usr/bin/env bash

KEY_LOCATION=/etc/ssl/private/nginx-selfsigned.key
CERTIFICAT_LOCATION=/etc/ssl/certs/nginx-selfsigned.crt
DIFFIE_LOCATION=/etc/nginx/dhparam.pem

echo "Installing nginx"
apt install -y nginx

rm /etc/nginx/sites-enabled/default

# Ssl
./gen_cert.sh $KEY_LOCATION $CERTIFICAT_LOCATION $DIFFIE_LOCATION
