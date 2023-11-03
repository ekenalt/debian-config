#!/bin/bash

sudo apt update
sudo apt install git wget curl zsh build-essential neovim extrepo -y
if test -f /proc/sys/fs/binfmt_misc/WSLInterop
then
  sudo echo "[interop]\nappendWindowsPath=false" | tee /etc/wsl.conf
fi
read -p 'git user.name: ' gitusername
git config --global user.name $gitusername
read -p 'git user.email: ' gituseremail
git config --global user.email $gituseremail
git config --global core.autocrlf input
git config --global core.editor 'vim'
zsh ./1-configure-zsh.sh
