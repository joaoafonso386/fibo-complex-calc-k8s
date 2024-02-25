#!/bin/bash

NAMESPACE="fibo"
NAMESPACE_EXISTS=$(kubectl get namespace $NAMESPACE --ignore-not-found)

if [[ -z "$NAMESPACE_EXISTS" ]]; then
    echo "Creating namespace $NAMESPACE"
    kubectl create namespace $NAMESPACE
    echo "Namespace added!"
else   
    echo "Namespace $NAMESPACE already present"
fi 