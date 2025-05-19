#doc https://hub.docker.com/layers/library/php/8.1-fpm/images/sha256-1ab821a38e3f2bc85f8b05b4a8288480c0195ceba2cd704b7c4d9572943659e6
FROM php:8.1-fpm

# Install Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Copy app code
COPY ./src /var/www/html

# Copy Nginx config
COPY ./nginx.conf /etc/nginx/nginx.conf

# Copy and set entrypoint script
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
