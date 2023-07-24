#!/bin/bash

sudo extrepo enable vscodium
sudo extrepo enable dotnet
sudo sed -i 's_\(deb http://deb\.debian\.org/debian/ [[:alpha:]]* main non-free-firmware\)_\1 contrib non-free_' /etc/apt/sources.list
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install dotnet-sdk-7.0 mono-complete ripgrep network-manager-openvpn mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer codium -y

mkdir $HOME/.local/share/applications
touch $HOME/.local/share/applications/Bitwarden.desktop
cat > $HOME/.local/share/applications/Bitwarden.desktop << EOF
[Desktop Entry]
Name=Bitwarden
Exec=$HOME/Applications/Bitwarden.AppImage
Type=Application
EOL
