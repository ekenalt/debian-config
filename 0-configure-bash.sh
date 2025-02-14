#!/bin/bash

sudo apt update
sudo apt install git wget curl zsh build-essential neovim extrepo -y
if grep -iq "microsoft" /proc/version
then
  echo '\n[interop]\nappendWindowsPath=false' | sudo tee -a /etc/wsl.conf
fi
read -p 'git user.name: ' gitusername
git config --global user.name $gitusername
read -p 'git user.email: ' gituseremail
git config --global user.email $gituseremail
git config --global core.autocrlf input
git config --global core.editor 'vi'
git config --global core.pager 'less -FX'
zsh ./1-configure-zsh.sh
