ZDOTDIR=$HOME/.config/zsh
export EDITOR="nvim"
export BROWSER="vivaldi-stable"
export PATH="$HOME/.bin:$HOME/.local/bin:/snap/bin:$PATH"
export NVM_DIR="$HOME/.config/nvm"

if [ -f $ZDOTDIR/$(hostname).env ]; then
    . $ZDOTDIR/$(hostname).env
fi
