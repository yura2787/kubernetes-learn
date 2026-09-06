# kubernetes-learn

Навчальний репозиторій: маніфести, конспекти та скрипти для вивчення Kubernetes.

## Структура

```
manifests/       навчальні маніфести, згруповані по темах
  01-pods/         Pod, ліміти, probes
  02-deployments/  Deployment, ReplicaSet, rollout
  03-services/     Service (ClusterIP/NodePort/LoadBalancer)
  04-config/       ConfigMap, Secret, env
  05-storage/      PV, PVC, StorageClass
  06-ingress/      Ingress, ingress-controller
helm/            власні чарти та values-файли
scripts/         допоміжні bash-скрипти (підняти/зняти кластер)
docs/            конспекти та шпаргалки
```

## Що потрібно встановити

```bash
brew install kubectl kind helm k9s
```

- `kubectl` — CLI для роботи з кластером
- `kind` — локальний кластер у Docker (альтернатива: `minikube`)
- `helm` — пакетний менеджер
- `k9s` — TUI для перегляду кластера (необов'язково, але зручно)

## Швидкий старт

```bash
./scripts/cluster-up.sh
```

Перевірити, що кластер живий:

```bash
kubectl get nodes
```

Застосувати маніфести з теми:

```bash
kubectl apply -f manifests/01-pods/
```

Прибрати за собою:

```bash
./scripts/cluster-down.sh
```

## Конспекти

- [Шпаргалка по kubectl](docs/cheatsheet.md)

## Правила репозиторію

- Секрети в git **не комітяться**. Для прикладів використовуй файли з суфіксом
  `.example.yaml` — вони дозволені в `.gitignore`, реальні `*secret*.yaml` — ні.
- Кожна тема — окрема тека в `manifests/`, файли нумеруються за порядком застосування.
