#!/bin/bash
set -e
# See: https://redhat-developer-demos.github.io/istio-tutorial/istio-tutorial/1.0.0/index.html
# Need to have a started minishift cluster 
# Need to have cloned the istio repo 
# Need to have added istioctl and oc in to $PATH

if [ ! -d "$1" ]; then
  echo "Istio repo does not exist"
  exit 1;
elif [ ! -f "$1/install/kubernetes/istio-demo.yaml" ]; then 
    echo "$1 does not contain the file /install/kubernetes/istio-demo.yaml"
    exit
fi

if [[ $(hash oc) ]]; then
  echo "oc not in path"
  exit 1;
fi

if [[ $(hash istioctl) ]]; then
  echo "oc not in path"
  exit 1;
fi

if [[ $(minishift status | head -1 | awk '{print $2}') != 'Running' ]]; then
  echo "Minishift is not Running"
  exit 1;
fi

echo -e "Installing Istio on Minishft ... "
cd $1 && pwd
minishift status
oc status
oc projects

oc apply -f install/kubernetes/istio-demo.yaml
oc project istio-system

oc expose svc istio-ingressgateway
oc expose svc servicegraph
oc expose svc grafana
oc expose svc prometheus
oc expose svc tracing