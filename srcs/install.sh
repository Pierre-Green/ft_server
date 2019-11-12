#!/usr/bin/env bash

export DB_NAME=wordpress
export DB_USER=user
export DB_PASS=password
export DB_HOST=localhost

./dependencies.sh
cd mysql && ./install.sh && cd ..
cd php && ./install.sh && cd ..
cd nginx && ./install.sh && cd ..
cd wordpress && ./install.sh && cd ..
