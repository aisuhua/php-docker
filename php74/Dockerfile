FROM ubuntu:20.04

LABEL maintainer="aisuhua <1079087531@qq.com>"

ARG DEBIAN_FRONTEND=noninteractive

ADD snippets/sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    software-properties-common \
    build-essential \
    tzdata \
    locales \
    vim \
    net-tools \
    curl \
    wget \
    ansible \
    imagemagick

RUN add-apt-repository -y ppa:ondrej/php \
&& sed -i "s/http:\/\/ppa.launchpad.net/https:\/\/launchpad.proxy.ustclug.org/g" /etc/apt/sources.list.d/*.list

RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-cli \
    php7.4-fpm \
    php7.4-curl \
    php7.4-dom \
    php7.4-fileinfo \
    php7.4-fpm \
    php7.4-gd \
    php7.4-gettext \
    php7.4-json \
    php7.4-mbstring \
    php7.4-pdo \
    php7.4-phar \
    php7.4-psr \
    php7.4-opcache \
    php7.4-simplexml \
    php7.4-tokenizer \
    php7.4-xml \
    php7.4-bcmath \
    php7.4-zip \
    php7.4-mysqli \
    php7.4-sqlite \
    php7.4-soap \
    php7.4-ldap \
    php7.4-iconv \
    php-pear \
    php7.4-intl \
    php7.4-ldap \
    php7.4-bz2 \
    php7.4-ctype \
    php7.4-exif \
    php7.4-apcu \
    php7.4-imagick \
    php7.4-msgpack \
    php7.4-igbinary \
    php7.4-mongodb \
    php7.4-memcache \
    php7.4-memcached \
    php7.4-redis \
    php7.4-amqp \
    php7.4-xdebug \
    php-phalcon3 \
    php7.4-snmp \
    php7.4-gmp \
&& apt-get remove --purge --auto-remove -y \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://mirrors.cloud.tencent.com/composer/composer.phar \
&& mv composer.phar /usr/local/bin/composer \
&& chmod 755 /usr/local/bin/composer \
&& composer config -g repo.packagist composer https://mirrors.cloud.tencent.com/composer/

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo Asia/Shanghai | tee /etc/timezone \
&& cp /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www.conf.default \
&& cp /etc/php/7.4/fpm/php.ini /etc/php/7.4/fpm/php.ini.default \
&& cp /etc/php/7.4/cli/php.ini /etc/php/7.4/cli/php.ini.default \
&& mkdir /run/php \
&& chmod 775 /run/php \
&& mkdir /opt/www \
&& chmod 775 /opt

USER 1001
WORKDIR /opt/www

STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD ["php-fpm7.4"]
