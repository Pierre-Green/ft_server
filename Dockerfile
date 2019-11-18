
FROM debian:buster

# Add config files
ADD srcs /
WORKDIR /install

# Permissions
RUN chmod +x *.sh
RUN chmod +x **/*.sh

# Installing
# RUN ./install.sh

EXPOSE 80

CMD [ "service", "nginx", "start" ]
