#!/bin/bash


minishift-version='v3.9.0'
if type minishift >/dev/null 2>&1; then
    minishift profile set istio-tutorial
    minishift config set memory 4GB
    minishift config set cpus 2
    minishift config set vm-driver virtualbox
    minishift config set image-caching true
    minishift addon enable admin-user
    minishift config set openshift-version $minishift-version
    minishift addon enable anyuid
    minishift start

    echo "using oc to log into minishift"
    eval $(minishift oc-env)
    eval $(minishift docker-env)
    oc login $(minishift ip):8443 -u admin -p admin
    minishift console
    oc get node 

else
    echo -e "Can not run minishift ...\n"
fi

