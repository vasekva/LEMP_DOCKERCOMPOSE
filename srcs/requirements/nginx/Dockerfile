FROM debian:buster

WORKDIR ./server_dir/

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx openssl php-gd php-xml -y

# RUN apt-get install vim wget curl

#old <--
# COPY . .
# COPY ./conf/ /var/www/
COPY ./conf/ .

#old <--cd
# COPY ./conf/default /etc/nginx/sites-available

# Remove the php.conf Nginx configuration file
#RUN rm -v /etc/nginx/default

# Copy a configuration file from the current directory
#ADD default /etc/nginx/

RUN mkdir /etc/nginx/logs

# Add a sample index file
#ADD index.html /www/data/
#ADD index.php /var/www/html

# Append "daemon off;" to the beginning of the configuration
#old <--
# RUN echo "daemon off;" >> /etc/nginx/default

# Create a runner script for the entrypoint
#COPY runner.sh /runner.sh
#old <--
# RUN chmod +x ./runner.sh
RUN chmod +x runner.sh

# Expose ports
EXPOSE 443

#old <--
# ENTRYPOINT ["./runner.sh"]

ENTRYPOINT ["bash", "runner.sh"]

# Set the php.conf command to execute
# when creating a new container
CMD ["nginx", "-g", "daemon off;"]
