#!/bin/bash

HOST=127.0.0.1
PORT=80

curl -vvv "http://$HOST:$PORT/healthcheck"
curl -vvv "http://$HOST:$PORT/environment"
#curl -vvv "http://127.0.0.1:80/static"
