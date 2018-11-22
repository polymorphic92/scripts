# #!/usr/bin/env bash


function dnf {
    dnf check-update
    sudo dnf --refresh upgrade -y
    sudo dnf install tree wget curl vim ranger -y
}

function flatpak {
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak update -y

    #Slack
    flatpak install flathub com.slack.Slack
}

function install_rust {
    curl https://sh.rustup.rs -sSf | sh -s -- -y 
}

function docker {

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

}

function postman {
    cd /tmp
    echo "Downloading Postman ..."
    wget -q https://dl.pstmn.io/download/latest/linux?arch=64 -O postman.tar.gz
    tar -xzf postman.tar.gz
    rm postman.tar.gz

    echo "Installing to opt..."
    if [ -d "/opt/Postman" ];then
        sudo rm -rf /opt/Postman
    fi
    sudo mv Postman /opt/Postman

    echo "Creating symbolic link..."
    if [ -L "/usr/bin/postman" ];then
        sudo rm -f /usr/bin/postman
    fi
    sudo ln -s /opt/Postman/Postman /usr/bin/postman

    echo "Installation completed successfully."
    echo "You can use Postman!"

}
function vscode {
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf install code
    # https://code.visualstudio.com/docs/setup/linux
}

function vim-addons {
    ##check vim is installed : 
        #which vim
    ##install vim-plug (manager): 
        #curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    #install plugins:  
        #vim +PlugInstall +qall
}




















