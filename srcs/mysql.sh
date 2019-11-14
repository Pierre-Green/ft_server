#!/usr/bin/env bash

VERSION="0.8.13-1_all"
DEB_URL=""
DEB_FILE="mysql.deb"

echo "Installing mysql in version $VERSION"

wget https://dev.mysql.com/get/mysql-apt-config_${VERSION}.deb -O $DEB_FILE

export DEBIAN_FRONTEND="noninteractive"

dpkg -i $DEB_FILE
apt -y update

debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password"
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password"

apt install -y mysql-server

mysqld --initialize-insecure --user=mysql >/dev/null 2>&1

/usr/bin/mysqld_safe >/dev/null 2>&1 &
