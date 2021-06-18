FROM debian:buster

WORKDIR ./host_tools_dir/

RUN apt-get update && \
    apt-get install nginx -y

EXPOSE 80

RUN mkdir /page/

COPY ./tools ./page/
COPY ./start.sh .

ENTRYPOINT [ "bash", "start.sh"]

CMD ["nginx", "-g", "daemon off;"]