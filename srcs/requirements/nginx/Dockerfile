FROM debian:buster

WORKDIR ./server_dir/

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx vim openssl php-gd php-xml wget -y


COPY . .
#
## Create dir for available servers
#RUN mkdir -p /var/www/html/server_dir/ && \
#    cp autoindex_on /etc/nginx/sites-available/ && \
#    rm /etc/nginx/sites-enabled/default && rm /etc/nginx/sites-available/default && \
#    ln -s /etc/nginx/sites-available/autoindex_on /etc/nginx/sites-enabled/my_first_server

# Remove the php.conf Nginx configuration file
#RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
#ADD nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/logs

# Add a sample index file
#ADD index.html /www/data/
#ADD index.php /var/www/html

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Create a runner script for the entrypoint
#COPY runner.sh /runner.sh
RUN chmod +x ./runner.sh

# Expose ports
EXPOSE 443

ENTRYPOINT ["./runner.sh"]

# Set the php.conf command to execute
# when creating a new container
CMD ["nginx"]
