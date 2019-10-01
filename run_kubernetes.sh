#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=liqx1558/api
# Step 2
# Run the Docker Hub container with kubernetes
kubectl run devops3 --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl expose deployment devops3 --type="NodePort" --port 80
export NODE_PORT=$(kubectl get services/devops3 -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT
