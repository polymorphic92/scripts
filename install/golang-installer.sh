#!/bin/bash

if [[ $1 =~ ^[0-9]+.[0-9]+.[0-9]+$ ]]; then
    printf "matched"
    VERSION=$1
    cd /home/$USER/Downloads && curl -O https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz

    sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
    sudo rm -f /usr/local/go$VERSION.linux-amd64.tar.gz
    sudo rm -f /home/$USER/Downloads/go$VERSION.linux-amd64.tar.gz

    if ! grep -q 'export PATH=$PATH:/usr/local/go/bin' "/home/$USER/.profile"; then
        echo "Adding go to /home/$USER/.profile becuse it is not there"
        echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/$USER/.profile
    fi
    source /home/$USER/.profile 
    go version
else 
    printf "does not match"
fi



