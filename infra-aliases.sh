#!/usr/bin/env bash
# vi: ft=sh

# Setup kubectl and gcloud aliases {{{

alias knonrunning="watch 'kubectl get pods --all-namespaces | grep -v Running'"
alias knodecounts="k get node --no-headers | awk '{print \$2}' | sort | uniq -c"

alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
kt() { kubetail --namespace $KUBE_NAMESPACE }

# Set default KUBE_NAMESPACE:
# export KUBE_NAMESPACE="${KUBE_NAMESPACE:-staging}"
#
# main alias for working with kubectl in a specific namespace
# most other k8s aliases depend on this
kc() {
  kubectl --namespace "$KUBE_NAMESPACE" "$@"
}
# namespace switching
alias knkube="export KUBE_NAMESPACE=kube-system"
alias kndefault="export KUBE_NAMESPACE=default"
alias knapplications="export KUBE_NAMESPACE=applications"
alias knstaging="export KUBE_NAMESPACE=staging"
alias knprod="export KUBE_NAMESPACE=prod"
alias kndev="export KUBE_NAMESPACE=dev"
alias kntest="export KUBE_NAMESPACE=test"
alias kninfra="export KUBE_NAMESPACE=infra"
knswitch() {
  export KUBE_NAMESPACE=$1
}

# view the IPs of pods
kips() {
  kc get pods -l app="$*" -o json \
    | jq -r '.items[] | .metadata.name + ": " + .status.podIP'
}

deploys() {
  k get --all-namespaces deploy -ojson | jq -r \
    '.items[] | .metadata.namespace + "\t " + .metadata.labels.app + "\t " + .metadata.labels.owner + "\t " + .metadata.labels.team' \
    | grep -v kube-system \
    | grep -v monitoring \
    | cut -f2- \
    | column -t \
    | sort \
    | uniq
}

# view pods for a given app
pods() {
  app=$1
  shift
  kc get pods -l app="$app" "$@"
}

# pods by ordinal
pod0() { kc get pods -l app="$*" -o jsonpath='{.items[0].metadata.name}' ; }
# alias fpod=pod0
pod1() { kc get pods -l app="$*" -o jsonpath='{.items[1].metadata.name}' ; }
pod2() { kc get pods -l app="$*" -o jsonpath='{.items[2].metadata.name}' ; }

# k8s shell
ksh() {
  kc exec -it "$(fpod "$1")" "${@:2}" sh
}

# tail logs
klogs() {
  if [ -z "$2" ]; then # didn't specify an index so use the first pod
    kc logs -f "$(pod1 "$1")"
  else
    kc logs -f "$("pod$2" "$1")"
  fi
}

# which images are running in which env?
# expects the name of a deployment as an arg
kimages() {
  echo -n "Prod: "
  kubectl get deployment -nprod "$1" -o jsonpath='{.spec.template.spec.containers[0].image}'
  echo
  echo -n "Staging: "
  kubectl get deployment -nstaging "$1" -o jsonpath='{.spec.template.spec.containers[0].image}'
  echo
}

# describe resource
kcd() { kc describe "$@" ; }

# port forwarding
alias kcpf="kc port-forward"
# kubetail
kt() { kubetail "$@" --namespace "$KUBE_NAMESPACE" ; }


# pending pods
pp() {
  kubectl get pods --all-namespaces -o json \
    | jq -r '.items[] | select(.status.phase != "Running" or ([ .status.conditions[] | select(.type == "Ready" and .state == false) ] | length ) == 1 ) | .metadata.namespace + "/" + .metadata.name'
}


# K8S RBAC

kroles() {
  kubectl get rolebindings,clusterrolebindings \
    --all-namespaces  \
    -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SERVICE_ACCOUNTS:subjects[?(@.kind=="ServiceAccount")].name'
}

ksecret() {
  kubectl get secret $1 -o json | jq -r '.data | map_values(@base64d)'
}

kcert() {
  kubectl get secret $1 -o json | jq -r --arg KEY "$2" '.data[$KEY]' | base64 -D | openssl x509 -noout -text
}

# kroles() {
#   # from https://stackoverflow.com/questions/55646821/how-to-find-which-role-or-clusterrole-binded-to-a-service-account-in-kubernetes
#   kubectl get rolebindings,clusterrolebindings \
#   --all-namespaces  \
#   -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SERVICE_ACCOUNTS:subjects[?(@.kind=="ServiceAccount")].name' \
#     | grep "$@"
# }

kperms() {
  # examples from 
  # https://stackoverflow.com/questions/54889458/kubernetes-check-serviceaccount-permissions

  k auth can-i create secret \
    --as=system:serviceaccount:yetibot:yetibot-vault-auth

  k auth can-i create secret \
    --as=system:serviceaccount:yetibot:default

  k auth can-i create deployments --namespace yetibot

  k auth can-i create deployments --namespace yetibot --as trevor.hartman@carta.com

  kcd clusterrole admin

  kcd clusterroles system:discovery

}

kversions() {
  alias copyver="k version -ojson | jq -r '.serverVersion.gitVersion' | pbcopy"
  alias printver="k version -ojson | jq -r '.serverVersion.gitVersion'"

  for k in $(kx | grep carta); do
    kx $k
    v=$(printver)
    echo $v
    echo
  done
}

kimages() {
  echo -n "Prod: "
  kubectl get deployment -nprod $1 -o jsonpath='{.spec.template.spec.containers[0].image}'
  echo
  echo -n "Dev: "
  kubectl get deployment -ndev $1 -o jsonpath='{.spec.template.spec.containers[0].image}'
  echo
  echo -n "Test: "
  kubectl get deployment -ntest $1 -o jsonpath='{.spec.template.spec.containers[0].image}'
  echo
}

# secret manager pod
alias smpod="k get po -l app.kubernetes.io/name=secret-manager -oname"

clusterdnsperf() {
  # kc exec -it $(kc get pods -l app=cluster-utils -o jsonpath="{.items[*].metadata.name}") sh
  kubectl run --namespace $KUBE_NAMESPACE -i --tty --rm dnsperf --image mrlesmithjr/dnsperf --command sh
}

alias nodeports="kc get svc -o json | jq -r '.items[] | \
  .np = .spec.ports[0].nodePort | select(.np != null) | \
  .metadata.name + \": \" + (.np | tostring)'"

# }}}

