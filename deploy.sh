#!/bin/bash

docker build -t zigoto/fibo-client:latest -t zigoto/fibo-client:$SHA -f ./client/Dockerfile ./client
docker build -t zigoto/fibo-server:latest -t zigoto/fibo-server:$SHA -f ./server/Dockerfile ./server
docker build -t zigoto/fibo-worker -t zigoto/fibo-worker:$SHA -f ./worker/Dockerfile ./worker

docker push zigoto/fibo-client:latest
docker push zigoto/fibo-server:latest
docker push zigoto/fibo-worker:latest

docker push zigoto/fibo-client:$SHA
docker push zigoto/fibo-server:$SHA
docker push zigoto/fibo-worker:$SHA

cd ./kubernetes

sh ./scripts/ci/install.sh

kubectl set image deployment/server-deployment server=zigoto/fibo-server:$SHA
kubectl set image deployment/client-deployment client=zigoto/fibo-client:$SHA
kubectl set image deployment/worker-deployment worker=zigoto/fibo-worker:$SHA