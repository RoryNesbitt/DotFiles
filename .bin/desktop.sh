#!/bin/sh

sudo pacman -Syyu --noconfirm kitty vivaldi discord steam docker pulseaudio pavucontrol tmux neovim nodejs npm wine yarn python-pip dash xclip fzf
yay -S --noconfirm realvnc-vnc-viewer openconnect teams nerd-fonts-fira-code

### LSP servers
sudo npm install -g @tailwindcss/language-server
yarn global add ansible-language-server yaml-language-server vscode-langservers-extracted emmet-ls vim-language-server typescript typescript-language-server
pip3 install 'python-lsp-server[all]'

#bashls
#clangd
#dockerls
#jsonls
#sumneko_lua
#texlab

sudo rm /bin/sh
sudo ln /bin/dash /bin/sh

### Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

### tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

exit

