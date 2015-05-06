FROM Shelvak/ruby:2.1

# Get source
WORKDIR $HOME
RUN git clone https://github.com/FRM-UTN/FireAlerter.git
RUN cd FireAlerter && rake install

EXPOSE 9800:9800

ENTRYPOINT ["ruby"]
CMD [ "$HOME/FireAlerter/lib/fire_alerter.rb" ]
