FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Nestor Coppi

#RUN apt-add-repository -y multiverse
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install build-essential libasound2-dev libasound2 \
	libasound2-data module-init-tools libsndfile1-dev gstreamer0.10-alsa \
	gstreamer0.10-doc gstreamer0.10-ff* gstreamer0.10-tools gstreamer0.10-x \
	gstreamer0.10-plugins-bad gstreamer0.10-plugins-base linux-sound-base \
	gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly \
	libgstreamer-plugins-base0.10-0 libgstreamer-plugins-base0.10-dev \
	libgstreamer0.10-0 libgstreamer0.10-dev  python-setuptools\
  libasound2 libasound2-plugins alsa-utils alsa-oss pulseaudio pulseaudio-utils \
  pavucontrol icecast2 darkice

RUN apt-get clean

RUN update-rc.d icecast2 defaults
RUN update-rc.d icecast2 enable
RUN usermod -aG pulse,pulse-access root
RUN pulseaudio -D
#RUN ls /dev
#RUN modprobe snd-dummy
#RUN ls /dev |grep sndA
#RUN pulseaudio --start
#RUN pactl load-module module-loopback latency_msec=1
# padsp darkice ## <== Le pasa el /dev/dsp
# RUN echo snd-seq-oss snd-pcm-oss snd-mixer-oss | xargs -n 1 modprobe




EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

RUN addgroup icecast2

ADD icecast.xml /etc/icecast2/icecast.xml
ADD icecast2-default /etc/default/icecast2
ADD darkice.cfg /etc/darkice.cfg

CMD /usr/bin/darkice
