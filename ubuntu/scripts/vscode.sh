#!/bin/bash

USER="vagrant"
export HOME="/home/$USER"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt update && apt install -y code

# Extensions
code --user-data-dir=$HOME/.config/Code --install-extension ms-vsliveshare.vsliveshare ms-python.python
chown -R vagrant:vagrant $HOME/
