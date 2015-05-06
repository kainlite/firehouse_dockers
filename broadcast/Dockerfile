FROM phusion/baseimage

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qq -y install build-essential devscripts autotools-dev \
  fakeroot dpkg-dev debhelper autotools-dev dh-make quilt ccache \
  libsamplerate0-dev libpulse-dev libaudio-dev lame libjack-jackd2-dev \
  libasound2-dev libtwolame-dev libfaad-dev libflac-dev \
  libshout3-dev libmp3lame-dev

RUN apt-get -qq -y install icecast2 darkice


########################
FROM ubuntu:trusty

MAINTAINER Manfred Touron "m@42.am"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 python-setuptools && \
    apt-get clean

RUN easy_install supervisor && \
    easy_install supervisor-stdout

CMD ["/start.sh"]
EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

ADD ./start.sh /start.sh
ADD ./etc /etc
RUN chown -R icecast2 /etc/icecast2
