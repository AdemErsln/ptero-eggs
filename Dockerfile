
FROM php:5.6-fpm-alpine

RUN docker-php-ext-install -j$(nproc) mysqli opcache

ADD php.ini /usr/local/etc/php.ini

FROM alpine:latest

RUN apk --update --no-cache add curl ca-certificates nginx
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
