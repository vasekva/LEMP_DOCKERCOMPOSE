FROM debian:buster

#ENV ip=192.168.99.127

#RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
#RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apt-get update
RUN apt-get install pure-ftpd openssl -y
#RUN apt add openrc
#RUN apt add telegraf
#RUN apt add openssl

#RUN openrc
#RUN touch /run/openrc/softlevel

#RUN adduser -D admin
#RUN echo admin:admin | chpasswd
#RUN mkdir -p ftps/admin

#get new ssl key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj \
	"/C=RU/ST=Ivanovo/L=IVANOVO/O=42Kazan/OU=Ivan/CN=localhost" -keyout /etc/ssl/private/pure-ftpd.pem \
	-out /etc/ssl/private/pure-ftpd.pem

COPY ./tools/ .
#COPY ./tools/telegraf.conf /etc/
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

EXPOSE 21 21000 21001 21002 21003 21004 21005

ENTRYPOINT [ "sh", "launch.sh" ]