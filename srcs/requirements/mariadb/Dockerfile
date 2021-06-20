FROM debian:buster

WORKDIR ./tools_dir/

COPY ./conf/        ./
COPY ./tools/       ./

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

EXPOSE 3306

RUN chmod +x    ./db.sh

ENTRYPOINT ["./db.sh"]

CMD ["mysqld"]