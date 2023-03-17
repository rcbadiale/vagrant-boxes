#!/bin/bash

PYTHON_VERSION=3.9.16
USER="vagrant"
export HOME="/home/$USER"
BASHRC="$HOME/.bashrc"

echo "Installing dependencies..."
apt update
apt install -y make git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
echo "-----------------------------------------"

echo "Installing PYENV"
curl https://pyenv.run | bash
echo "-----------------------------------------"

if grep -Fxq 'export PATH="$HOME/.pyenv/bin:$PATH"' $BASHRC; then
  echo "PYENV already in PATH"
else
  echo "Adding PYENV to PATH"
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $BASHRC
  echo 'eval "$(pyenv init --path)"' >> $BASHRC
  echo 'eval "$(pyenv virtualenv-init -)"' >> $BASHRC
fi

echo "-----------------------------------------"
echo "Installing Python $PYTHON_VERSION"
$HOME/.pyenv/bin/pyenv update
$HOME/.pyenv/bin/pyenv install $PYTHON_VERSION
$HOME/.pyenv/bin/pyenv global $PYTHON_VERSION

echo "-----------------------------------------"
echo "Fixing permissions"
chown $USER:$USER -R $HOME/.pyenv

echo "-----------------------------------------"
echo "All done."
