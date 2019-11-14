
FROM debian:buster

# Add config files
ADD srcs/* /App/
WORKDIR /App

# Permissions
RUN chmod +x *.sh

# Installing
RUN ./install.sh

EXPOSE 80

CMD [ "service", "nginx", "start" ]
