#!/bin/sh

sudo pacman -Syyu --noconfirm kitty vivaldi discord steam docker pulseaudio pavucontrol tmux neovim nodejs npm wine yarn python-pip dash xclip fzf ripgrep cmake luarocks
yay -S --noconfirm realvnc-vnc-viewer openconnect teams nerd-fonts-fira-code

sudo rm /bin/sh
sudo ln /bin/dash /bin/sh

## Neovim
git clone git@github.com:rorynesbitt/neovim ~/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
### null-ls formatters
luarocks install --server=https://luarocks.org/dev luaformatter

## Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

## Tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

exit

