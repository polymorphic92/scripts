#!/bin/bash


minishift_version="${$1:-"v3.9.0"}"
cpus="${$2:-"2"}"
mem="${$3:-"4"}"
vm_driver="${$4:-"virtualbox"}"
profile="${$5:-"test"}"

if type minishift >/dev/null 2>&1; then
    minishift profile set $profile
    minishift config set memory $memGB
    minishift config set cpus $cpus
    minishift config set vm-driver $vm_driver
    minishift config set image-caching true
    minishift addon enable admin-user
    minishift config set openshift-version $minishift_version
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