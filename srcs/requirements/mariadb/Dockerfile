FROM debian:buster

WORKDIR ./my_own_server

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

COPY ./tools/ .

CMD bash start_mariadb.sh