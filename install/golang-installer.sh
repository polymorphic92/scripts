#!/bin/bash
set -e
if [[ $1 =~ ^[0-9]+.[0-9]+.[0-9]+$ ]]; then
    dl=go$1.linux-amd64.tar.gz
    go_dir=/usr/local

    cd /home/$USER/Downloads && curl -O https://dl.google.com/go/$dl

    if [ -d "$go_dir/go/bin" ]; then 
        sudo rm -r "$go_dir/go" && echo "Removed old go dir: $go_dir/go/bin"
 
    fi

    sudo tar -C $go_dir -xzf $dl

    if ! grep -q 'export PATH=$PATH:'$go_dir'/go/bin' "/home/$USER/.profile"; then
        echo "Adding go to /home/$USER/.profile becuse it is not there"
        echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/$USER/.profile
    fi

    # might to change location of setting path 
    if ! grep -q 'PATH=$PATH:$(go env GOPATH)/bin' "/home/$USER/.bashrc"; then
        echo 'PATH=$PATH:$(go env GOPATH)/bin' >> /home/$USER/.bashrc
    fi

    #create go dir if not already created
    if [ ! -d /home/$USER/go ]; then mkdir /home/$USER/go; fi


    source /home/$USER/.profile 
    go version

    rm -f /home/$USER/Downloads/$dl
else 
    printf "Golang version is not correct"
fi