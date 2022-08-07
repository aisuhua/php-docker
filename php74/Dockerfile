FROM ubuntu:20.04

LABEL maintainer="aisuhua <1079087531@qq.com>"

ARG DEBIAN_FRONTEND=noninteractive

ADD sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    software-properties-common \
    build-essential \
    tzdata \
    locales \
    vim \
    curl \
    wget \
&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo Asia/Shanghai | tee /etc/timezone \
&& rm -rf /var/lib/apt/lists/*

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
    php7.4-phalcon \
    php7.4-snmp \
    php7.4-gmp \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://mirrors.cloud.tencent.com/composer/composer.phar && \
    mv composer.phar /usr/local/bin/composer && \
    chmod 755 /usr/local/bin/composer && \
    composer config -g repo.packagist composer https://mirrors.cloud.tencent.com/composer/

COPY docker.conf /etc/php/7.4/fpm/pool.d/
COPY zz-docker.conf /etc/php/7.4/fpm/pool.d/

RUN sed -i "s/^user = www-data/;user = www-data/" /etc/php/7.4/fpm/pool.d/www.conf \
&& sed -i "s/^group = www-data/;group = www-data/" /etc/php/7.4/fpm/pool.d/www.conf \
&& sed -i "s/^listen.owner = www-data/;listen.owner = www-data/" /etc/php/7.4/fpm/pool.d/www.conf \
&& sed -i "s/^listen.group = www-data/;listen.group = www-data/" /etc/php/7.4/fpm/pool.d/www.conf \
&& sed -i "s/listen = .*/listen = 127.0.0.1:9000/" /etc/php/7.4/fpm/pool.d/www.conf \
&& sed -i "s/;pm.status_path = .*/pm.status_path = \/phpfpm_status/" /etc/php/7.4/fpm/pool.d/www.conf \
&& sed -i "s/;date.timezone =.*/date.timezone = PRC/" /etc/php/7.4/fpm/php.ini \
&& sed -i "s/upload_max_filesize =.*/upload_max_filesize = 30M/" /etc/php/7.4/fpm/php.ini \
&& sed -i "s/post_max_size =.*/post_max_size = 30M/" /etc/php/7.4/fpm/php.ini \
&& sed -i "s/disable_functions = .*/;disable_functions = /" /etc/php/7.4/fpm/php.ini \
&& sed -i "s/;date.timezone =.*/date.timezone = PRC/" /etc/php/7.4/cli/php.ini \
&& sed -i "s/upload_max_filesize =.*/upload_max_filesize = 30M/" /etc/php/7.4/cli/php.ini \
&& sed -i "s/post_max_size =.*/post_max_size = 30M/" /etc/php/7.4/cli/php.ini \
&& mkdir /run/php \
&& chmod 775 /run/php \
&& mkdir /opt/www \
&& chmod 775 /opt

USER 1001
WORKDIR /opt/www

STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD ["php-fpm7.4"]
