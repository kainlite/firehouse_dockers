FROM shelvak/ruby:2.1

# Get source
WORKDIR $HOME
RUN git clone https://github.com/FRM-UTN/FireAlerter.git
RUN cd FireAlerter && bundle install

EXPOSE 9800:9800

CMD [ "cd $HOME/FireAlerter && bundle exec rake" ]
