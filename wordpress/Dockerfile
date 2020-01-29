FROM wordpress:fpm-alpine

COPY ./php.ini /usr/local/etc/php/php.ini

USER root
COPY --chown=root:root ./wp_db_password /root/wp_db_password
