# Kubernetes Canary Deployment Demo

Simple Blue/Green canary deployment using Argo Rollouts.

## 🚀 Quick Start

```bash
# 1. Setup environment
./scripts/setup.sh

# 2. Install Argo Rollouts
./scripts/install-argo-rollouts.sh

# 3. Build images
./scripts/build-images.sh

# 4. Deploy canary
./scripts/deploy-canary.sh

# 5. Start dashboard
./scripts/dashboard.sh