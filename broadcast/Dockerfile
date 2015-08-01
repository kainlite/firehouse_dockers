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
  pavucontrol icecast2 darkice git-core


RUN apt-get install -qq -y software-properties-common wget \
  gcc g++ make python-software-properties build-essential

RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -qq -y ruby2.1 ruby2.1-dev git-core curl zlib1g-dev \
  libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev \
  libcurl4-openssl-dev libffi-dev

# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# install things globally, for great justice
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
RUN gem update --system \
  && gem install bundler \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin"

ENV BUNDLE_APP_CONFIG $GEM_HOME


RUN apt-get clean

RUN git clone https://github.com/FRM-UTN/firehouse_audio
RUN cd firehouse_audio && bundle install

RUN update-rc.d icecast2 defaults
RUN update-rc.d icecast2 enable
RUN usermod -aG pulse,pulse-access root
RUN pulseaudio --system -D
# RUN ls /dev
# RUN modprobe snd-dummy
# RUN ls /dev |grep sndA
# RUN pulseaudio --start
# RUN pactl load-module module-loopback latency_msec=1
#  padsp darkice ## <== Le pasa el /dev/dsp
#  RUN echo snd-seq-oss snd-pcm-oss snd-mixer-oss | xargs -n 1 modprobe

RUN apt-get install -qq -y mplayer
RUN mkdir -p $HOME/.mplayer
RUN echo "lirc=no" >> $HOME/.mplayer/config
RUN apt-get update
RUN apt-get -qq -y install linphone

EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

RUN addgroup icecast2
ADD icecast.xml /etc/icecast2/icecast.xml
ADD icecast2-default /etc/default/icecast2
ADD darkice.cfg /etc/darkice.cfg


ADD start.sh /start.sh
RUN chmod 777 /start.sh
CMD ["/start.sh"]
