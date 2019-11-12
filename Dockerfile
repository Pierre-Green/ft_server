
FROM debian:buster

# Add config files
ADD srcs/*.sh /

# Installing mysql
RUN /install_mysql.sh
