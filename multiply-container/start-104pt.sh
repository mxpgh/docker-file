#!/bin/sh
if [ -z "$1" ]
then
    echo 'Error: 缺少参数：容器名.'
    exit 1
fi

cn=$1
echo "容器名: ${cn}"

basepath=$(cd `dirname $0`; pwd)
echo "current path: ${basepath}"

cl=$(docker ps -a | grep ${cn} | awk '{print $1}')
if [ ! ${cl} ]; then
   echo
else
    docker stop ${cl}
    docker rm ${cl}
fi

img=$(docker images | grep pt-104 | awk '{print $3}')
if [ ! ${img} ]; then
   echo
else
    docker rmi ${img}
fi

docker load < ${basepath}/pt-104.tar
docker run -idt --restart=always --name ${cn} pt-104:v1.0 /bin/sh




