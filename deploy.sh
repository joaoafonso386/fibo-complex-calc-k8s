#!/bin/bash

docker build -t zigoto/fibo-client -f ./client/Dockerfile ./client
docker build -t zigoto/fibo-server -f ./server/Dockerfile ./server
docker build -t zigoto/fibo-worker -f ./worker/Dockerfile ./worker

docker push zigoto/fibo-client
docker push zigoto/fibo-server
docker push zigoto/fibo-worker

sh ./kubernetes/scripts/ci/install.sh

kubectl set image deployment/server-deployment server=zigoto/fibo-server