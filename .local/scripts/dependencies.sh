if [ ! -f /usr/bin/tmux ] && [ ! -f /bin/tmux ]; then
    echo "Installing tmux"
    sudo apt install tmux -y || sudo pacman -S --noconfirm tmux
fi
if [ "$USER" = "pi" ]; then
    # Raspberry Pi only dependencies
    if [ ! -f /bin/snap ] && [ ! -f /usr/bin/snap ]; then
        echo "Installing snap"
        sudo apt install snapd -y
    fi
    if ! [ -f /snap/bin/nvim ]; then
        echo "Installing neovim via snap"
        sudo snap install nvim --beta --classic
    fi
else
    # Non-Raspberry Pi dependencies
    if ! [ -d $NVM_DIR ]; then
        echo "Installing Node via NVM"
        mkdir $NVM_DIR
        XDG_OLD=$XDG_CONFIG_HOME
        XDG_CONFIG_HOME=$NVM_DIR
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
        XDG_CONFIG_HOME-$XDG_OLD
        source $HOME/.zshrc
        nvm install --lts
    fi
    if ! [ -f /usr/bin/nvim ]; then
        echo "Installing Neovim"
        sudo pacman -S neovim --noconfirm || curl -Lo $HOME/.bin/nvim https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && chmod u+x $HOME/.bin/nvim
    fi
fi
