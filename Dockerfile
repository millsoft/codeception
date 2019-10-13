FROM webdevops/php-dev:7.3
MAINTAINER Michael Milawski michael.milawski@planet-itservices.com


WORKDIR /repo

# Install composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin
RUN composer global require --prefer-dist --no-interaction --optimize-autoloader --apcu-autoloader \
        "hirak/prestissimo"

RUN composer require --prefer-dist --no-interaction --optimize-autoloader --apcu-autoloader \
        "codeception/robo-paracept:dev-master"

RUN composer require --prefer-dist --no-interaction --optimize-autoloader --apcu-autoloader \
        "codeception/codeception"


# Prepare application
ENV PATH /repo:/repo/vendor/bin:${PATH}
ENTRYPOINT ["codecept"]

# Prepare host-volume working directory
RUN mkdir /project
WORKDIR /project