FROM php:7.1-apache

COPY ./docker/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY ./docker/php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y \
        wget \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) pdo pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN a2enmod rewrite

ADD ./docker/install_composer.sh /usr/local/bin/install_composer.sh
RUN /usr/local/bin/install_composer.sh
