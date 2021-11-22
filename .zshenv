ZDOTDIR=$HOME/.config/zsh
export EDITOR="nvim"
export BROWSER="vivaldi-stable"
export PATH="$HOME/.bin:$HOME/.local/bin:/snap/bin:$PATH"
export NVM_DIR="$HOME/.config/nvm"
export SHCOLOUR="14"
export ECHOCOLOUR="1;36"
if [ -f $ZDOTDIR/device/$(hostname).env ]; then
    . $ZDOTDIR/device/$(hostname).env
fi
