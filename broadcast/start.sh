#!/bin/bash

pulseaudio -k
sleep 1
pulseaudio -D --system
sleep 2
echo "Pulse and icecast: "
pulseaudio -k
echo $(ps aux |grep pulse)
sleep 1

echo "Rake:"
cd /firehouse_audio
bundle exec rake


#cd /

#echo $(which linphonecsh)
#echo $(whereis linphonecsh)
#linphonecsh init
#echo $(ps aux |grep linphone)
#sleep 2
#linphonecsh register --host 192.168.1.10 --username linphone --password linphone1234 && \
  #linphonecsh generic 'autoanswer enable'

