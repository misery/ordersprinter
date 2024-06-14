FROM php:8.3.8RC1-fpm-alpine3.19

RUN apk --no-cache upgrade -a -U

WORKDIR /var/www/html
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd pdo_mysql bcmath zip intl opcache mysqli ftp
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
