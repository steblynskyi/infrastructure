#!/bin/bash

set -e

echo "Start creating namespaces in cluster"
kubectl apply -f ./
printf "\n"