#!/bin/bash
set -e

for dir in */ *.yaml; do

    if [ "$(basename "$dir")" != "scripts" ]; then
        kubectl apply -f $dir || exit 1 
    fi

done

echo "Kubernetes resources uploaded successfully!"