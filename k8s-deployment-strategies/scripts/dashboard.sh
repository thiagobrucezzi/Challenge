#!/bin/bash

echo "=== Starting Argo Rollouts Dashboard ==="

echo "Dashboard will be available at: http://localhost:3100"
echo "Press Ctrl+C to stop the dashboard"
echo ""

# Start the native dashboard
kubectl argo rollouts dashboard