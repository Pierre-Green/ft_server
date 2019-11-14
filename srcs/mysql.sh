#!/usr/bin/env bash

VERSION="0.8.13-1_all"
DEB_URL=""
DEB_FILE="mysql.deb"

echo "Installing mysql in version $VERSION"

wget https://dev.mysql.com/get/mysql-apt-config_${VERSION}.deb -O $DEB_FILE

dpkg -i $DEB_FILE
apt -y update
apt install -y mysql-server
