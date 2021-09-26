#!/bin/sh

sudo pacman -Syyu --noconfirm kitty vivaldi discord steam docker pavucontrol tmux neovim nodejs npm

yay -S --noconfirm realvnc-vnc-viewer openconnect

### Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
systemctl enable docker
systemctl start docker
