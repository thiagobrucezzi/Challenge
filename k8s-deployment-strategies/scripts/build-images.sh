#!/bin/bash

set -e

echo "=== Building Docker Images ==="

# Build Blue App (v1)
echo "Building Blue App v1..."
docker build -t belo:blue -f apps/Dockerfile apps/ \
  --build-arg APP_VERSION=v1.0.0 \
  --build-arg APP_COLOR=blue

# Build Green App (v2)  
echo "Building Green App v2..."
docker build -t belo:green -f apps/Dockerfile apps/ \
  --build-arg APP_VERSION=v2.0.0 \
  --build-arg APP_COLOR=green

# Load images to minikube
echo "Loading images to Minikube..."
minikube image load belo:blue
minikube image load belo:green

echo "✅ Images built and loaded:"
echo "   - belo:blue (v1.0.0)"
echo "   - belo:green (v2.0.0)"