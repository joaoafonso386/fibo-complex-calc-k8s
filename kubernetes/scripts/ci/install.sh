#!/bin/bash

if [ $# -eq 0 ]; then
    echo -e "You need to specify a resource as argument\nUsage: $0 <file.yaml> \nUsage: $0 <dir/> "
    exit 1
fi

sh ./scripts/add_namespace.sh

echo -e "\e[1;31mApplying $# k8s resources: $@\e[0m"

for resource in "$@"; do
    kubectl apply -f "$resource" -n fibo
done

