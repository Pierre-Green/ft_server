#!/usr/bin/env bash

echo "Installing nginx"
apt install -y nginx

rm /etc/nginx/sites-enabled/default
