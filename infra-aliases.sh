#!/usr/bin/env bash
# vi: ft=sh

# Setup kubectl and gcloud aliases {{{

export KUBE_NAMESPACE="${KUBE_NAMESPACE:-staging}"
# main alias for working with kubectl in a specific namespace
# most other k8s aliases depend on this
kc() {
  kubectl --namespace "$KUBE_NAMESPACE" "$@"
}
# namespace switching
alias knkube="export KUBE_NAMESPACE=kube-system"
alias kndefault="export KUBE_NAMESPACE=default"
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

# }}}
