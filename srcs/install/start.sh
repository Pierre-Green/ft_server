#!/usr/bin/env bash

mysqld_safe &
service php7.3-fpm start
service nginx start

echo "Everything is running just fine"
