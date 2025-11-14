#!/bin/bash

set -e

echo "=== Deploying Canary Rollout ==="

# Apply manifests
echo "Deploying canary rollout and service..."
kubectl apply -f manifests/canary-rollout.yaml
kubectl apply -f manifests/canary-service.yaml

# Wait for initial rollout
echo "Waiting for initial rollout to complete..."
kubectl argo rollouts get rollout canary-demo -w

echo "✅ Canary deployment completed!"
echo ""
echo "To update to Green version (v2):"
echo "  kubectl argo rollouts set image canary-demo web-app=belo:green"
echo ""
echo "To watch the rollout:"
echo "  kubectl argo rollouts get rollout canary-demo -w"
echo ""
echo "To promote manually:"
echo "  kubectl argo rollouts promote canary-demo"