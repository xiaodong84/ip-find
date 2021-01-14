#!/bin/bash
docker build -t ip-find .
docker image prune -f
