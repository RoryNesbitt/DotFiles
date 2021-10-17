#!/bin/sh

sudo pacman -Syyu --noconfirm kitty vivaldi discord steam docker pulseaudio pavucontrol tmux neovim nodejs npm wine ttf-fira-code yarn python-pip
yay -S --noconfirm realvnc-vnc-viewer openconnect teams

### LSP servers
yarn global add ansible-language-server yaml-language-server vscode-langservers-extracted emmet-ls vim-language-server typescript typescript-language-server
pip3 install 'python-lsp-server[all]'

#bashls
#clangd
#dockerls
#jsonls
#pylsp
#sumneko_lua
#texlab

###Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

### Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

exit
