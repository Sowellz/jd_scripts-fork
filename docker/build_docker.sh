#!/bin/bash
current_path=$(
cd $(dirname "${BASH_SOURCE[0]}")
pwd
)
falgs=true

read -p "请输入要删除的镜像地址：" dimages
while(flags=true)
do

function remove_oldimage(){
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi ${dimages}
}

function remove_err_image(){
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images|grep none|awk '{print $3}')
}

function build_image(){
docker build -t winlinux.cn/jd_scripts .
}

remove_oldimage
build_image
if [ $? -eq 0 ];then
cd ${current_path}
docker-compose -f /root/lxk0301/docker/multis.yml up -d
break
else
remove_err_image
fi

done
