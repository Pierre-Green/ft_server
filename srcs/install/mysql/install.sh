#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"
VERSION="0.8.13-1_all"
DEB_URL="https://dev.mysql.com/get/mysql-apt-config_${VERSION}.deb"
DEB_FILE="mysql.deb"
DB_ROOT_PASS="$(openssl rand -base64 16)"

echo "Installing mysql in version $VERSION"
wget $DEB_URL -O $DEB_FILE
dpkg -i $DEB_FILE
apt -y update

echo "mysql-community-server mysql-community-server/root-pass $DB_ROOT_PASS" | debconf-set-selections
echo "mysql-community-server mysql-community-server/re-root-pass $DB_ROOT_PASS" | debconf-set-selections

apt install -y mysql-community-server

cp my.cnf /etc/mysql/my.cnf

mysqld_safe &
