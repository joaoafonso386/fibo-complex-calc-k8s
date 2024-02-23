#!/bin/bash
set -e

for dir in */ *.yaml; do

    if [ "$(basename "$dir")" != "scripts" ]; then
        kubectl apply -f $dir
    fi

done