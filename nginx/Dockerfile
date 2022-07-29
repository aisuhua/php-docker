FROM alpine:3.16

LABEL maintainer="aisuhua <1079087531@qq.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apk add --no-cache \
    bash \
    nginx \
    nginx-mod-http-image-filter

RUN mkdir -p \
        /var/run/nginx \
        /var/cache/nginx \
        /var/lib/nginx  

RUN chown -R 0:0 \
        /etc/nginx \
        /var/run/nginx \
        /var/cache/nginx \
        /var/lib/nginx \
    && chmod -R 775 \
        /etc/nginx \
        /var/run/nginx \
        /var/cache/nginx \
        /var/lib/nginx \
        /opt \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

USER 10001

WORKDIR /opt

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
