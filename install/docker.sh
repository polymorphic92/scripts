#!/bin/bash
set -e

# Uninstall old versions
sudo dnf remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-selinux \
                docker-engine-selinux \
                docker-engine

 # Install the dnf-plugins-core package - commands to manage your DNF repositories from the command line.
sudo dnf -y install dnf-plugins-core

 # Set up the stable repository
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

 # Install Docker CE
sudo dnf install docker-ce

 # Start Docker
sudo systemctl start docker

 # Create the docker group
sudo groupadd docker

 # Add your user to the docker group
sudo usermod -aG docker $USER

 # Enable docker to start on system boot via systemd

 sudo systemctl enable docker

# #install docker-compose 

if ! [ -x "$(command -v docker-compose)" ]; then
  COMPOSE_VERSION=$(curl -s -o /dev/null -I -w "%{redirect_url}\n" https://github.com/docker/compose/releases/latest | grep -oP "[0-9]+(\.[0-9]+)+$")
  curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  curl -L https://raw.githubusercontent.com/docker/compose/$COMPOSE_VERSION/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
  docker-compose --version
else 
    printf "docker-compose already installed"
fi
