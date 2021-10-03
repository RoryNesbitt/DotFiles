#!/bin/sh

sudo pacman -Syyu --noconfirm kitty vivaldi discord steam docker pulseaudio pavucontrol tmux neovim nodejs npm

yay -S --noconfirm realvnc-vnc-viewer openconnect teams

### Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
systemctl enable docker
systemctl start docker
