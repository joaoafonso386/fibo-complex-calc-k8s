#!/bin/bash
set -e

$INGRESS_EXISTS=$(kubectl get -f ingress.yaml -n ingress-nginx --ignore-not-found)

for dir in */; do

    if [ "$(basename "$dir")" != "scripts" ]; then
        kubectl apply -f $dir || exit 1 
    fi

done

echo "Kubernetes resources uploaded successfully!"