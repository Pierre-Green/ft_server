#!/usr/bin/env bash

VERSION="0.8.13-1_all"
DEB_URL=""
DEB_FILE="mysql.deb"

echo "Installing mysql in version $VERSION"

curl https://dev.mysql.com/get/mysql-apt-config_${VERSION}.deb -o $DEB_FILE
dpkg -i mysql-apt-config*
apt update
apt install mysql-server
