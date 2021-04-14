#!/bin/bash
#注意会产生一些中间的垃圾镜像.
docker build -t ip-find .
docker image prune -f
