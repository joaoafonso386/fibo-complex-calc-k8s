#!/bin/bash

if [ $# -eq 0 ]; then
    echo -e "You need to specify a resource as argument\nUsage: $0 <file.yaml> \nUsage: $0 <dir/> "
    exit 1
fi

sh ./scripts/add_namespace.sh

kubectl apply -f $1 -n fibo
