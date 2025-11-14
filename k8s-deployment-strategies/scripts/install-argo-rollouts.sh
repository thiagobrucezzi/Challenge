#!/bin/bash

set -e

echo "=== Installing Argo Rollouts ==="

# Install kubectl plugin
echo "Installing kubectl argo-rollouts plugin..."
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x kubectl-argo-rollouts-linux-amd64
sudo mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

# Verify plugin installation
echo "Plugin version:"
kubectl-argo-rollouts version

# Install Argo Rollouts in cluster
echo "Installing Argo Rollouts in Kubernetes..."
kubectl create namespace argo-rollouts --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

# Wait for installation to complete
echo "Waiting for Argo Rollouts to be ready..."
sleep 10
kubectl wait --for=condition=available deployment/argo-rollouts -n argo-rollouts --timeout=180s

echo "Next Step: ./scripts/build-images.sh"
echo "✅ Argo Rollouts installed successfully!"