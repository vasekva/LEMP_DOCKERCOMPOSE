FROM debian:buster

WORKDIR ./server_dir/

COPY ./conf/ .
COPY ./tools/db.sh .
COPY ./tools/secure.sh .

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

VOLUME ./tools/error.txt:/var/log/mysql/error.log

EXPOSE 3306

RUN chmod +x ./db.sh

ENTRYPOINT ["./db.sh"]

RUN echo "CMD"
CMD ["mysqld"]