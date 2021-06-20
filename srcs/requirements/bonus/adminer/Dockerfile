FROM debian:buster

WORKDIR ./tools_dir/

COPY tools/start.sh .

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y adminer wget php-fpm php-mysql

EXPOSE 8080

ENTRYPOINT [ "bash", "start.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]