#!/usr/bin/env bash

set -ex

action="$1"

echo "Check if DigitalOcean cluster"
doCluster=$(kubectl cluster-info | grep ondigitalocean)
if [ -z "$doCluster" ];
  then
    echo "Not a DigitalOcean cluster, exiting.."
    exit 1;
  else
    echo "=========================="
    echo "Cluster-Info"
    echo "$doCluster"
    echo "==========================";
fi


echo "Make sure to source environment variables"

if [[ "$action" == "install" ]]; then
    IMAGE_TAG=$(git rev-parse HEAD)
    echo "Deploying Image Tag: $IMAGE_TAG"
    echo "Sourcing environment variables..."
    source .env.prod
    echo "Updating Dependencies: Backend"
    helm dependency update charts/backend

    echo "Installing helm charts: backend and frontend"
    helm upgrade --install backend charts/backend \
      --set containerRepository="$BACKEND_CONTAINER_REPOSITORY" \
      --set imageTag="$IMAGE_TAG" \
      --set flaskSecretKey="$FLASK_SECRET_KEY" \
      --set flaskAppPort="$FLASK_APP_PORT" \
      --set debug="$DEBUG" \
      --set dnsName="$DNS_NAME" \
      --set letsEncryptServer="$LETS_ENCRYPT_SERVER" \
      --set letsEncryptEmail="$LETS_ENCRYPT_EMAIL" \
      --set namespace="$NAMESPACE" \
      --set-file imageCredentials.password="$GCP_SERVICE_ACCOUNT_FILE"

    echo "Updating Dependencies: Frontend"
    helm dependency update charts/frontend

    helm upgrade --install frontend charts/frontend \
      --set containerRepository="$FRONTEND_CONTAINER_REPOSITORY" \
      --set imageTag="$IMAGE_TAG" \
      --set namespace="$NAMESPACE" \
      --set-file imageCredentials.password="$GCP_SERVICE_ACCOUNT_FILE"

elif [[ "$action" == "delete" ]]; then
    echo "Deleting helm charts: backend and frontend"
   helm delete backend frontend
else
    echo "no argument provided, required at least one of: install or delete"
fi

