#!/bin/sh

sudo pacman -Syu --noconfirm kitty vivaldi discord steam docker tmux neovim nodejs npm wine yarn python-pip dash xclip fzf ripgrep cmake ansible
yay  --noconfirm realvnc-vnc-viewer openconnect teams nerd-fonts-fira-code

sudo rm /bin/sh
sudo ln /bin/dash /bin/sh

## Neovim
git clone git@github.com:rorynesbitt/neovim ~/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
### null-ls formatters
sudo --noconfirm pacman -S prettier
yay --noconfirm stylua
pip install black

## Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

## Tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

exit

