#!/bin/zsh
echo $1
container=$(sudo docker ps|grep "firehousedockers_$1" | awk '{ print $1 }')
echo $container

sudo docker exec -it $container /bin/bash
