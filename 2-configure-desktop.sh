#!/bin/bash

sudo extrepo enable vscodium
sudo extrepo enable dotnet
sudo extrepo enable steam
sudo apt install dotnet-sdk-7.0 mono-complete ripgrep network-manager-openvpn mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

touch $HOME/.local/share/applications/Bitwarden.desktop
cat > $HOME/.local/share/applications/Bitwarden.desktop << EOF
[Desktop Entry]
Name=Bitwarden
Exec=$HOME/Applications/Bitwarden.AppImage
Type=Application
EOL
