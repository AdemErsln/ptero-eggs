FROM php:8.0-fpm-alpine

RUN apk --no-cache add curl ca-certificates nginx git

# Gerekli PHP eklentilerini yükleyin
RUN apk add --no-cache \
    php8-xml \
    php8-exif \
    php8-openssl \
    php8-pdo \
    php8-pdo_mysql \
    php8-pdo_sqlite \
    php8-mysqli \
    php8-bcmath \
    php8-bz2 \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-fileinfo \
    php8-fpm \
    php8-gd \
    php8-gettext \
    php8-gmp \
    php8-iconv \
    php8-json \
    php8-mbstring \
    php8-odbc \
    php8-openssl \
    php8-pdo_dblib \
    php8-pdo_mysql \
    php8-pdo_odbc \
    php8-pdo_pgsql \
    php8-pdo_sqlite \
    php8-phar \
    php8-session \
    php8-simplexml \
    php8-soap \
    php8-sqlite3 \
    php8-tokenizer \
    php8-xmlreader \
    php8-zip

# Composer'ı yükleyin
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer
USER container
ENV  USER container
ENV HOME /home/container


WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
