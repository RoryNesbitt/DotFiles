ZDOTDIR=$HOME/.config/zsh
export EDITOR="vi"
export PATH="$HOME/.local/scripts:$HOME/.local/bin:/snap/bin:$(yarn global bin):$PATH" 2> /dev/null
export NVM_DIR="$HOME/.config/nvm"
export SHCOLOUR="14"
export ECHOCOLOUR="1;36"
if [ -f $ZDOTDIR/device/$(hostname).env ]; then
    . $ZDOTDIR/device/$(hostname).env
fi
