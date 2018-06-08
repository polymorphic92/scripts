#!/bin/bash

if [[ $1 =~ ^[0-9]+.[0-9]+.[0-9]+$ ]]; then
    dl=go$1.linux-amd64.tar.gz
    go_dir=/usr/local

    cd /home/$USER/Downloads && curl -O https://dl.google.com/go/$dl
    ls -a /home/$USER/Downloads
    sudo tar -C $go_dir -xzf $dl
    rm -f /home/$USER/Downloads/$dl

    if ! grep -q 'export PATH=$PATH:'$go_dir'/go/bin' "/home/$USER/.profile"; then
        echo "Adding go to /home/$USER/.profile becuse it is not there"
        echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/$USER/.profile
    fi
    source /home/$USER/.profile 
    go version
else 
    printf "does not match"
fi



