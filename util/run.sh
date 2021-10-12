#!/bin/bash

# socket folder for reverse proxy, also change in Dockerfile
export SOCKET_PATH="/var/run/nginx_sidecar"

# make directory only if necessary
[ ! -d $SOCKET_PATH ] && sudo mkdir -p $SOCKET_PATH

# stop nginx if already running (for current dev usage)
docker stop nginx-reverse-proxy

# comes from the project https://github.com/robbintt/nginx-reverse-proxy-sidecar-template
docker run --rm --name nginx-reverse-proxy -d -p 80:80 -v $SOCKET_PATH:$SOCKET_PATH nginx-reverse-proxy

docker run --rm -it -v `pwd`:/app/tapdancer -v $SOCKET_PATH:$SOCKET_PATH tapdancer bash -c "pyenv exec pipenv run uwsgi --ini uwsgi.ini"
