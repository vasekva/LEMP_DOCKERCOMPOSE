FROM debian:buster

WORKDIR /tools_dir/

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx openssl php-gd php-xml -y

COPY ./conf/            /tools_dir/
COPY ./tools/runner.sh  /tools_dir/

RUN mkdir /etc/nginx/logs

RUN chmod +x runner.sh

EXPOSE 443

ENTRYPOINT ["bash", "runner.sh"]

CMD ["nginx", "-g", "daemon off;"]