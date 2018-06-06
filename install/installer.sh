# #!/usr/bin/env bash








# Need break script up into separate scripts and call each part in script



























# sudo dnf upgrade -y
# flatpak update -y

# sudo dnf install tree wget curl vim ranger -y



# # curl https://sh.rustup.rs -sSf | sh

# ###################################################################
# ########################## Docker #################################
# ###################################################################

# # Uninstall old versions
# sudo dnf remove docker \
#                   docker-client \
#                   docker-client-latest \
#                   docker-common \
#                   docker-latest \
#                   docker-latest-logrotate \
#                   docker-logrotate \
#                   docker-selinux \
#                   docker-engine-selinux \
#                   docker-engine

# # Install the dnf-plugins-core package - commands to manage your DNF repositories from the command line.
# sudo dnf -y install dnf-plugins-core

# # Set up the stable repository
# sudo dnf config-manager \
#     --add-repo \
#     https://download.docker.com/linux/fedora/docker-ce.repo


# # Install Docker CE
# sudo dnf install docker-ce

# # Start Docker
# sudo systemctl start docker

# # Create the docker group
# sudo groupadd docker

# # Add your user to the docker group
# sudo usermod -aG docker $USER

# # Enable docker to start on system boot via systemd

# sudo systemctl enable docker

# ###################################################################
# ########################## Postman ################################
# ###################################################################

# cd /tmp || exit
# echo "Downloading Postman ..."
# wget -q https://dl.pstmn.io/download/latest/linux?arch=64 -O postman.tar.gz
# tar -xzf postman.tar.gz
# rm postman.tar.gz

# echo "Installing to opt..."
# if [ -d "/opt/Postman" ];then
#     sudo rm -rf /opt/Postman
# fi
# sudo mv Postman /opt/Postman

# echo "Creating symbolic link..."
# if [ -L "/usr/bin/postman" ];then
#     sudo rm -f /usr/bin/postman
# fi
# sudo ln -s /opt/Postman/Postman /usr/bin/postman

# echo "Installation completed successfully."
# echo "You can use Postman!"



