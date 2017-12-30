FROM alpine:edge

LABEL AUTHOR=Zgray<cnzgray@qq.com>

WORKDIR /root

ENV RPC_SECRET=Hello
ENV ENABLE_AUTH=false
ENV DOMAIN=0.0.0.0:80
ENV ARIA2_USER=user
ENV ARIA2_PWD=password

# For build image in local quickly
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && apk add wget bash curl openrc screen aria2 tar --no-cache

RUN curl https://getcaddy.com | bash -s personal http.filemanager

ADD aria2c.sh /root/aria2c.sh
ADD conf /root/conf

COPY Caddyfile /usr/local/caddy/Caddyfile
COPY SecureCaddyfile /usr/local/caddy/SecureCaddyfile

RUN mkdir -p /usr/local/www && mkdir -p /usr/local/www/aria2

#AriaNg
RUN mkdir /usr/local/www/aria2/Download && cd /usr/local/www/aria2 \
 && touch /root/conf/aria2.session \
 && wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/0.3.0/aria-ng-0.3.0.zip \
 && unzip aria-ng-0.3.0.zip \
 && rm -rf aria-ng-0.3.0.zip \
 && chmod -R 755 /usr/local/www/aria2 \
 && chmod +x /root/aria2c.sh

#The folder to store ssl keys
VOLUME /root/conf

# For user downloaded files
VOLUME /data

EXPOSE 6800 80 443



ENTRYPOINT ["/bin/sh", "/root/aria2c.sh"]
# CMD ["/bin/sh", "/root/aria2c.sh" ]


