FROM webdevops/php-nginx:alpine-php7

ENV WEB_DOCUMENT_ROOT=/app/webroot

COPY . /app/

RUN set -x \
    && cd /app \
    && composer install --no-dev \
    && chmod -R 0777 cache/ \
    && docker-run-bootstrap \
    && docker-image-cleanup
