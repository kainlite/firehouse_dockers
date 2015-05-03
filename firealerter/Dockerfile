FROM Shelvak/ruby

# Get source
WORKDIR $HOME
RUN git clone https://github.com/FRM-UTN/FireAlerter.git
RUN cd FireAlerter && rake install

EXPOSE 9800

CMD [ "ruby $HOME/FireAlerter/lib/fire_alerter.rb" ]
