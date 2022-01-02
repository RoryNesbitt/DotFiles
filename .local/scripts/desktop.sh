#!/bin/sh

sudo pacman -Syyu --noconfirm kitty vivaldi discord steam docker pulseaudio pavucontrol tmux neovim nodejs npm wine yarn python-pip dash xclip fzf ripgrep
yay -S --noconfirm realvnc-vnc-viewer openconnect teams nerd-fonts-fira-code

sudo rm /bin/sh
sudo ln /bin/dash /bin/sh

### Neovim
git clone git@github.com:rorynesbitt/neovim ~/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

### Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

### tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

exit

