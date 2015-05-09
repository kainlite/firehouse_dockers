FROM shelvak/ruby:2.1                                                                 
                                                                                      
MAINTAINER Néstor Coppi <nestorcoppi@gmail.com>                                       
                                                                                      
ENV DEBIAN_FRONTEND noninteractive                                                    

RUN apt-get install -qq -y postgresql-server-dev-9.3 nodejs \
                           postgresql-client-9.3 imagemagick

RUN git clone https://github.com/FRM-UTN/firehouse                                    

ADD database.yml /firehouse/config/database.yml
ADD starting_the_milonga.sh /firehouse/starting_the_milonga.sh
RUN chmod 777 /firehouse/starting_the_milonga.sh

WORKDIR firehouse                                                                     
                                                                                      
RUN cp config/app_config.example.yml config/app_config.yml                            
RUN mkdir -p /shared
RUN ln -sf $(pwd) /shared/firehouse                                                   
                                                                                      
CMD bundle exec unicorn -E production -c config/unicorn.rb  
