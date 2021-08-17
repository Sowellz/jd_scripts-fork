#!/bin/sh
while true
do
read -p "请输入要下载的.js文件：" pstring
pstring2=$(echo $pstring|cut -d"/" -f7)
wget -O $pstring2 https://ghproxy.com/$pstring
done
