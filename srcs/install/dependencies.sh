#!/usr/bin/env bash

echo "Installing dependencies..."
apt update -y
apt upgrade -y
apt install -y gnupg curl lsb-release wget openssl
