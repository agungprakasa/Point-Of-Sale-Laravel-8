FROM webdevops/php-nginx:8.1

ENV PHP_DATE_TIMEZONE Asia/Jakarta
ENV PHP_DISPLAY_ERRORS 0
ENV PHP_MEMORY_LIMIT -1
ENV PHP_UPLOAD_MAX_FILESIZE 500M
ENV PHP_POST_MAX_SIZE 500M
ENV PHP_MAX_EXECUTION_TIME 600
ENV ACCEPT_EULA=Y
ENV TZ="Asia/Jakarta"

COPY . /app

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/vhost.conf /opt/docker/etc/nginx/vhost.conf

RUN chown -R application:application /app
RUN chmod 777 -R /app/storage/*

WORKDIR /app
RUN composer install
