if ! [ -d ${HOME}/.nvm ]; then
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
        source $HOME/.zshrc
        nvm install --lts
fi
