#!/bin/bash

echo "entrose"
echo $(ps aux |grep pulse)
pulseaudio -k
pulseaudio -D
sleep 2
echo $(ps aux |grep pulse)
echo $(ps aux |grep icecast)
/etc/init.d/icecast2 start
sleep 2
echo $(ps aux |grep icecast)

cd /firehouse_audio && rake&
echo $(ps aux |grep rake)

cd /
darkice
