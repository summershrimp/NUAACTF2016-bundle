#!/bin/bash
set +e

S0="${BASH_SOURCE[0]}"
DIRNAME="$( dirname "$S0")"
DIR="$( cd "$DIRNAME" && pwd)"

cd $DIR
mkdir -p mysql
mkdir -p log

docker rm -f nuaactf_platform
docker run -d --name=nuaactf_platform --net=host --restart=always -v $DIR/web:/app/web -v $DIR/tinyctf-platform:/app/tinyctf nuaactf-python bash -c "/app/tinyctf/bootstrap.sh"

docker rm -f nuaactf_nginx
docker run -d --name=nuaactf_nginx --net=host --restart=always -v $DIR/log:/var/log -v $DIR/nginx/conf.d:/etc/nginx/conf.d -v $DIR/tinyctf-platform:/app/tinyctf nginx:1.8.1

docker rm -f nuaactf_pwn3
docker run -d --name=nuaactf_pwn3 --net=host --restart=always -v $DIR/pwn3:/app -m 512m --cpuset-cpus=0,1 ubuntu /app/pwn3.elf

docker rm -f nuaactf_mysql
docker run -d --name=nuaactf_mysql --net=host --restart=always -v $DIR/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="030405hjcduemn398ch7823rc" mysql

docker rm -f nuaactf_php-fpm
docker run -d --name=nuaactf_php-fpm --net=host --restart=always -v $DIR/web:/app/web nuaactf-php-fpm
