# kubernetes-learn

A learning repository: manifests, notes and scripts for studying Kubernetes.

## Structure

```
manifests/       learning manifests, grouped by topic
  01-pods/         Pod, resource limits, probes
  02-deployments/  Deployment, ReplicaSet, rollout
  03-services/     Service (ClusterIP/NodePort/LoadBalancer)
  04-config/       ConfigMap, Secret, env
  05-storage/      PV, PVC, StorageClass
  06-ingress/      Ingress, ingress controller
helm/            custom charts and values files
scripts/         helper bash scripts (bring the cluster up/down)
docs/            notes and cheat sheets
```

## Prerequisites

```bash
brew install kubectl kind helm k9s
```

- `kubectl` — CLI for talking to the cluster
- `kind` — local cluster running in Docker (alternative: `minikube`)
- `helm` — package manager
- `k9s` — TUI for browsing the cluster (optional, but handy)

## Quick start

```bash
./scripts/cluster-up.sh
```

Check that the cluster is alive:

```bash
kubectl get nodes
```

Apply the manifests for a topic:

```bash
kubectl apply -f manifests/01-pods/
```

Clean up afterwards:

```bash
./scripts/cluster-down.sh
```

## Notes

- [kubectl cheat sheet](docs/cheatsheet.md)

## Repository conventions

- Secrets are **never** committed. For examples use files with the
  `.example.yaml` suffix — those are allowed by `.gitignore`, while real
  `*secret*.yaml` files are not.
- Each topic gets its own directory under `manifests/`, with files numbered in
  the order they should be applied.
