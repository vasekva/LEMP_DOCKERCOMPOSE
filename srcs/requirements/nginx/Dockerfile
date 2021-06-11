FROM debian:buster

WORKDIR ./server_dir/

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx openssl php-gd php-xml -y

COPY ./conf/ .
COPY ./tools/runner.sh .

RUN mkdir /etc/nginx/logs

RUN chmod +x runner.sh

# Expose ports
EXPOSE 443

ENTRYPOINT ["bash", "runner.sh"]

# Set the php.conf command to execute
# when creating a new container
CMD ["nginx", "-g", "daemon off;"]
