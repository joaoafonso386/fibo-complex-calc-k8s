#!/bin/bash
set -e

INGRESS_EXISTS=$(kubectl get -f ingress.yaml -n ingress-nginx --ignore-not-found)

if [ -z "$INGRESS_EXISTS" ]; then
    echo "Ingress resource already exists. Skipping..."
else
    echo "Ingress resource doesn't exist. Applying..."
    kubectl apply -f ingress.yaml -n ingress-nginx || exit 1
fi

for dir in */; do

    if [ "$(basename "$dir")" != "scripts" ]; then
        kubectl apply -f $dir || exit 1 
    fi

done

echo "Kubernetes resources uploaded successfully!"