#!/usr/bin/env bash

VERSION="4.9.1"
TAR_URL="https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz"
TAR_NAME="pma.tar.gz"

echo "Installing phpmyadmin version $VERSION"
curl $TAR_URL -o $TAR_NAME
tar xvf $TAR_NAME
rm $TAR_NAME
mv phpMyAdmin-* /usr/share/phpmyadmin
mkdir -p /var/lib/phpmyadmin/tmp
chown -R www-data:www-data /var/lib/phpmyadmin
mkdir /etc/phpmyadmin/
cp /usr/share/phpmyadmin/config.sample.inc.php  /usr/share/phpmyadmin/config.inc.php

