#!/bin/bash

sh ../scripts/add_namespace.sh

kubectl apply -f . -n fibo
