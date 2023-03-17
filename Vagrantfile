# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.synced_folder "data/", "/vagrant_data", create: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
  end

  config.vm.provision "shell", path: 'scripts/lxqt.sh'
  config.vm.provision "shell", path: 'scripts/vscode.sh'
  config.vm.provision "shell", path: 'scripts/pyenv-installer.sh'
  config.vm.provision "shell", inline: 'reboot'
end
