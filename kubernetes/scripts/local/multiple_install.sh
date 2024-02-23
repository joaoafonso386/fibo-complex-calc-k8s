#!/bin/bash
set -e

SCRIPT_NAME=$0
RESOURCES=$#
RESOURCE_NAME=$@

if [ $# -eq 0 ]; then
    echo "

    You need to specify a resource as argument
    Usage: $SCRIPT_NAME <file.yaml>
    Usage: $SCRIPT_NAME <dir/>

    "
    exit 1
fi

sh ./scripts/add_namespace.sh

echo -e "\e[1;31mApplying $RESOURCES k8s resources: $RESOURCE_NAME\e[0m"

for resource in "$@"; do
    kubectl apply -f "$resource" -n fibo
done

