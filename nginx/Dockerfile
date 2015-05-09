FROM phusion/baseimage

MAINTAINER Néstor Coppi <nestorcoppi@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -qq -y nginx

RUN rm /etc/nginx/sites-enabled/default

ADD firehouse /etc/nginx/sites-enabled/firehouse

EXPOSE 80:80

RUN mkdir -p /logs
RUN mkdir -p /shared

VOLUME ["/shared", "/tmp"]

CMD nginx -g 'daemon off;'
