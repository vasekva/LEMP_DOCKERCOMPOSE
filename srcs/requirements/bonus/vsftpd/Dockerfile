FROM debian:buster

WORKDIR ./tools_dir/

RUN apt-get update && \
    apt-get install -y vsftpd supervisor && \
    mkdir -p /var/run/vsftpd/empty

RUN mkdir -p /var/log/supervisor

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY tools/start.sh ./
ADD conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir /ftp
RUN mkdir /wp_ftp_content

VOLUME ["/ftp"]

EXPOSE 20 21
EXPOSE 12020 12021 12022 12023 12024 12025

ENTRYPOINT ["./start.sh"]

CMD ["/usr/bin/supervisord"]