#!/usr/bin/env bash

set -ex

if [[ -z "$IMAGE_TAG" ]]; then
   echo "$IMAGE_TAG" variable is not set, setting it to 'latest'
   IMAGE_TAG=latest
else
   echo "Image Tag: $IMAGE_TAG"
fi

BACKEND_IMAGE=registry.digitalocean.com/aklabs-sandbox/k8s_demo_backend:$IMAGE_TAG
BACKEND_DOCKERFILE=docker/backend/Dockerfile

FRONTEND_IMAGE=registry.digitalocean.com/aklabs-sandbox/k8s_demo_frontend:$IMAGE_TAG
FRONTEND_DOCKERFILE=docker/frontend/Dockerfile

if [ $1 = "backend" ]; then
   image=$BACKEND_IMAGE
   dockerfile=$BACKEND_DOCKERFILE
elif [ $1 = "frontend" ]; then
   image=$FRONTEND_IMAGE
   dockerfile=$FRONTEND_DOCKERFILE
else
  echo "Invalid option"
  exit 1
fi

echo "Building $1 docker Image"
docker build --tag "$image" --file $dockerfile .

echo "Pushing $1 Image"
docker push "$image"
