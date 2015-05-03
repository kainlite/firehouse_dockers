FROM phusion/baseimage

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install python-software-properties
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install ruby2.1 git-core curl zlib1g-dev \
  build-essential libssl-dev libreadline-dev libyaml-dev \
  libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev

# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# install things globally, for great justice
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
RUN gem install bundler \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin"

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

MAINTAINER Néstor Coppi <nestorcoppi@gmail.com>

CMD ['bash']
