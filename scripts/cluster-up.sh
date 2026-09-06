#!/usr/bin/env bash
# Піднімає локальний kind-кластер для навчання.
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-k8s-learn}"

if ! command -v kind >/dev/null 2>&1; then
  echo "kind не встановлено. Встанови: brew install kind" >&2
  exit 1
fi

if kind get clusters 2>/dev/null | grep -qx "$CLUSTER_NAME"; then
  echo "Кластер '$CLUSTER_NAME' вже існує."
else
  kind create cluster --name "$CLUSTER_NAME"
fi

kubectl cluster-info --context "kind-$CLUSTER_NAME"
