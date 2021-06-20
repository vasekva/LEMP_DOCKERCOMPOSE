FROM debian:buster

WORKDIR ./tools_dir/

RUN apt-get update && \
    apt-get install nginx -y

EXPOSE 80

RUN mkdir           /page/

COPY ./tools/page/          ./page/
COPY ./tools/start.sh       ./

ENTRYPOINT [ "bash", "start.sh"]

CMD ["nginx", "-g", "daemon off;"]