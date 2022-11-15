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
    php8.0 \
    php8.0-cli \
    php8.0-fpm \
    php8.0-curl \
    php8.0-dom \
    php8.0-fileinfo \
    php8.0-fpm \
    php8.0-gd \
    php8.0-gettext \
    php8.0-mbstring \
    php8.0-pdo \
    php8.0-phar \
    php8.0-psr \
    php8.0-opcache \
    php8.0-simplexml \
    php8.0-tokenizer \
    php8.0-xml \
    php8.0-bcmath \
    php8.0-zip \
    php8.0-mysqli \
    php8.0-sqlite \
    php8.0-soap \
    php8.0-ldap \
    php8.0-iconv \
    php-pear \
    php8.0-intl \
    php8.0-ldap \
    php8.0-bz2 \
    php8.0-ctype \
    php8.0-exif \
    php8.0-apcu \
    php8.0-imagick \
    php8.0-msgpack \
    php8.0-igbinary \
    php8.0-mongodb \
    php8.0-memcache \
    php8.0-memcached \
    php8.0-redis \
    php8.0-amqp \
    php8.0-xdebug \
    php-phalcon4 \
    php8.0-snmp \
    php8.0-gmp \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://mirrors.cloud.tencent.com/composer/composer.phar && \
    mv composer.phar /usr/local/bin/composer && \
    chmod 755 /usr/local/bin/composer && \
    composer config -g repo.packagist composer https://mirrors.cloud.tencent.com/composer/

COPY docker.conf /etc/php/8.0/fpm/pool.d/
COPY zz-docker.conf /etc/php/8.0/fpm/pool.d/

RUN sed -i "s/^user = www-data/;user = www-data/" /etc/php/8.0/fpm/pool.d/www.conf \
&& sed -i "s/^group = www-data/;group = www-data/" /etc/php/8.0/fpm/pool.d/www.conf \
&& sed -i "s/^listen.owner = www-data/;listen.owner = www-data/" /etc/php/8.0/fpm/pool.d/www.conf \
&& sed -i "s/^listen.group = www-data/;listen.group = www-data/" /etc/php/8.0/fpm/pool.d/www.conf \
&& sed -i "s/listen = .*/listen = 127.0.0.1:9000/" /etc/php/8.0/fpm/pool.d/www.conf \
&& sed -i "s/;pm.status_path = .*/pm.status_path = \/8fpm_status/" /etc/php/8.0/fpm/pool.d/www.conf \
&& sed -i "s/;date.timezone =.*/date.timezone = PRC/" /etc/php/8.0/fpm/php.ini \
&& sed -i "s/upload_max_filesize =.*/upload_max_filesize = 30M/" /etc/php/8.0/fpm/php.ini \
&& sed -i "s/post_max_size =.*/post_max_size = 30M/" /etc/php/8.0/fpm/php.ini \
&& sed -i "s/disable_functions = .*/;disable_functions = /" /etc/php/8.0/fpm/php.ini \
&& sed -i "s/;date.timezone =.*/date.timezone = PRC/" /etc/php/8.0/cli/php.ini \
&& sed -i "s/upload_max_filesize =.*/upload_max_filesize = 30M/" /etc/php/8.0/cli/php.ini \
&& sed -i "s/post_max_size =.*/post_max_size = 30M/" /etc/php/8.0/cli/php.ini \
&& mkdir /run/php \
&& chmod 775 /run/php \
&& mkdir /opt/www \
&& chmod 775 /opt

# install ansible
RUN apt-get update \
&& apt-get install -y ansible \
&& rm -rf /var/lib/apt/lists/*

USER 1001
WORKDIR /opt/www

STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD ["php-fpm8.0"]
#ENTRYPOINT ["tail"]
#CMD ["-f","/dev/null"]
