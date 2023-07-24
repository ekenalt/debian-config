#!/bin/bash

sudo apt update
sudo apt install git wget curl zsh build-essential neovim extrepo -y
read -p 'git user.name:' gitusername
git config --global user.name $gitusername
read -p 'git user.email:' gituseremail
git config --global user.email $gituseremail
git config --global core.autocrlf input
zsh ./shellconfig1.sh
