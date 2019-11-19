#!/usr/bin/env bash

echo "Installing PHP"
apt-get install -y php php-fpm php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql php-curl php-gd php-intl php-soap php-xml php-xmlrpc php-zip

service php7.3-fpm start
