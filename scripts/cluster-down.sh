#!/usr/bin/env bash
# Видаляє локальний kind-кластер.
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-k8s-learn}"
kind delete cluster --name "$CLUSTER_NAME"
