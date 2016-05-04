#!/bin/sh
set -ex

docker-machine create \
  --driver virtualbox \
  --virtualbox-disk-size 100000 \
  default

docker-machine stop
VBoxManage modifyvm default --natnet1 "192.168.98/24"

docker-machine start
eval "$(docker-machine env)"
