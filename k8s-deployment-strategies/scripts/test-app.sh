#!/bin/bash

echo "=== Testing Application ==="

# Port forward to access the app
echo "Starting port forwarding..."
echo "App will be available at: http://localhost:8080"
echo "Press Ctrl+C to stop testing"

kubectl port-forward svc/canary-demo-service 8080:80