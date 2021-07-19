#!/bin/bash
cd /root/lxk0301/docker

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
if [[ $? -eq 0 ]];then
docker-compose -f ./multis.yml up -d
else
exit
fi
