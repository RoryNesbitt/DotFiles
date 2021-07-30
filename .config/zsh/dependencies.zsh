if ! [ -d $NVM_DIR ]; then
    mkdir $NVM_DIR
    XDG_OLD=$XDG_CONFIG_HOME
    XDG_CONFIG_HOME=$NVM_DIR
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    XDG_CONFIG_HOME-$XDG_OLD
    source $HOME/.zshrc
    nvm install --lts
fi
