#! /bin/bash

# apt-get update
# apt-get install curl -y
# curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# mv ./kubectl /usr/local/bin/kubectl
# export KUBE_EDITOR="nano"window

# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh

# apt-get install git -y

alias k='kubectl'

#Install Istio
# kubectl create namespace istio-system
# kubectl create namespace istio-ingress
# # kubectl label namespace istio-system istio-injection=enabled
# kubectl label namespace istio-ingress istio-injection=enabled

# helm repo add istio https://istio-release.storage.googleapis.com/charts && helm repo update
# helm install istio-base istio/base -n istio-system
# helm install istiod istio/istiod -n istio-system --wait
# helm install istio-gateway istio/gateway -n istio-ingress

#Install Argo
kubectl create namespace argocd
kubectl label namespace argocd istio-injection=enabled

helm repo add argo https://argoproj.github.io/argo-helm && helm repo update
helm install argocd argo/argo-cd --namespace=argocd

#Install Kubernetes Dashboard
kubectl create namespace kubernetes-dashboard
# kubectl label namespace kubernetes-dashboard istio-injection=enabled

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl apply -f service-account.yaml

# Needs More testing
# helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/ && helm repo update
# helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard -n kubernetes-dashboard


# Kong Install
# kubectl create namespace kong
# kubectl label namespace kong istio-injection=enabled
# helm repo add kong https://charts.konghq.com && helm repo update
# helm install kong kong/kong --namespace=kong

# Testing Application Installs
# kubectl create namespace bookinfo
# kubectl create namespace emojivoto
# kubectl label namespace bookinfo istio-injection=enabled
# kubectl label namespace emojivoto istio-injection=enabled

# kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/bookinfo/platform/kube/bookinfo.yaml -n bookinfo
# Use with Kong
# kubectl apply -f bookinfo-ingress.yaml
# curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/emojivoto.yml | kubectl apply -f -


#Install Istio Add Ons
# kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/addons/prometheus.yaml
# kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/addons/grafana.yaml
# kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/addons/kiali.yaml




#Postgres
kubectl create namespace postgresql
helm repo add bitnami https://charts.bitnami.com/bitnami && helm repo update
helm install postgres bitnami/postgresql --namespace=postgresql --set auth.postgresPassword=abc123

# VAULT INSTALL
# kubectl create namespace vault
# kubectl label namespace vault istio-injection=enabled

# helm repo add hashicorp https://helm.releases.hashicorp.com && helm repo update
# helm install vault hashicorp/vault --namespace=vault -f values.yaml


# kubectl port-forward --namespace vault svc/vault-ui 8200:8200

git clone https://github.com/JarenDamm/argocd.git
kubectl -n argocd apply -f argocd/vault/app.yaml
# kubectl -n argocd apply -f argocd/non-prod/argo-cd.yaml
# kubectl -n argocd apply -f argocd/istio/istiod.yaml
# kubectl -n argocd apply -f argocd/istio/istio-gateway.yaml

# kubectl create namespace strimzi
# kubectl create namespace kafka

# kubectl label namespace kafka istio-injection=enabled
# kubectl label namespace strimzi istio-injection=enabled


# # sleep 10

# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# git clone https://github.com/JarenDamm/Strimzi-Demo

# # kubectl -n kafka apply -f Strimzi-Demo/operator/strimzi-cluster-operator-0.31.1.yaml

# # kubectl -n kafka apply -f Strimzi-Demo/cluster/per-kafka-multi.yaml

# git clone https://github.com/JarenDamm/argocd.git

# # kubectl -n argocd apply -f argocd/non-prod/argo-cd.yaml
# # kubectl -n argocd apply -f argocd/istio/istio-base.yaml
# kubectl -n argocd apply -f argocd/istio/istiod.yaml
# # kubectl -n argocd apply -f argocd/kube-dashboard/kube-dashboard.yaml