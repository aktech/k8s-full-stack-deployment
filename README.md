# Kubernetes Full Stack Deployment

[![Build status](https://github.com/aktech/k8s-full-stack-deployment/actions/workflows/image.yml/badge.svg)](https://github.com/aktech/k8s-full-stack-deployment/actions/workflows/image.yml?query=workflow%3ABuild+branch%3Amain)
[![Deployment](https://github.com/aktech/k8s-full-stack-deployment/actions/workflows/deploy.yml/badge.svg)](https://github.com/aktech/k8s-full-stack-deployment/actions/workflows/deploy.yml?query=workflow%3ABuild+branch%3Amain)


Deploy a Full stack React + Flask Application with Kubernetes and Helm
and local development via docker-compose.

## Local setup

```bash
docker-compose up
```

## Docker Images

The images for backend and frontend are built on GitHub Actions and pushed to
DigitalOcean container registry.

## Deployment

The deployment is done via GitHub releases. Create a release to trigger a deployment.
