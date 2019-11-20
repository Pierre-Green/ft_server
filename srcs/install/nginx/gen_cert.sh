#!/usr/bin/env bash

#Required
domain=localhost
commonname=localhost

#Change to your company details
country=FR
state=Paris
locality=Paris
organization=42
organizationalunit=42
email=pguthaus@student.42.fr

#Optional
password="$(openssl rand -base64 16)"

echo "Generating key request for $domain"

#Create the request
echo "Creating CSR"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $1 -out $2 \
    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"

openssl dhparam -out $3 2048
