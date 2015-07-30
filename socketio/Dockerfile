FROM phusion/baseimage

MAINTAINER Néstor Coppi <nestorcoppi@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -qq -y git nodejs

RUN git clone https://github.com/FRM-UTN/firehouse_socketio

WORKDIR $HOME/firehouse_socketio
RUN npm install

EXPOSE 8085:8085

CMD node app.js
