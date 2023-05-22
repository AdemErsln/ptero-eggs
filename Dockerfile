FROM php:8.0-fpm-alpine

RUN apk --no-cache add curl ca-certificates nginx git \
    && docker-php-ext-install pdo_mysql
RUN apk add --no-cache php8-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

USER container
ENV USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
