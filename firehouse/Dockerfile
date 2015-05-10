FROM shelvak/ruby:2.1

MAINTAINER Néstor Coppi <nestorcoppi@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -qq -y postgresql-server-dev-9.3 nodejs \
                           postgresql-client-9.3 imagemagick

RUN git clone https://github.com/FRM-UTN/firehouse

ADD database.yml /firehouse/config/database.yml
ADD starting_the_milonga.sh /firehouse/starting_the_milonga.sh
RUN chmod 777 /firehouse/starting_the_milonga.sh

RUN mkdir -p /shared
RUN mkdir -p /shared/firehouse
RUN mkdir -p /shared/firehouse/public
RUN mkdir -p /shared/firehouse/uploads
RUN mkdir -p /shared/firehouse/log
RUN rm -Rf /firehouse/public
RUN rm -Rf /firehouse/uploads
RUN ln -sf /shared/firehouse/public /firehouse
RUN ln -sf /shared/firehouse/uploads /firehouse
RUN ln -sf /shared/firehouse/uploads /firehouse/public
RUN ln -sf /shared/firehouse/log /firehouse

WORKDIR firehouse

RUN cp config/app_config.example.yml config/app_config.yml

RUN bundle install --without development test --deployment --quiet

CMD bundle exec unicorn_rails -c /firehouse/config/unicorn.rb -E production

