
FROM debian:buster

# Add config files
ADD srcs /
WORKDIR /install

# Permissions
RUN chmod +x *.sh
RUN chmod +x **/*.sh

# Installing
RUN ./install.sh

# Expose ports
EXPOSE 80
EXPOSE 443

# Start nginx

CMD [ "./start.sh" ]
