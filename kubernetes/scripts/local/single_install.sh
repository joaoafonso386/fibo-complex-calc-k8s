#!/bin/bash

sh ./scripts/add_namespace.sh

kubectl apply -f $1 -n fibo
