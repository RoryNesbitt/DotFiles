ZDOTDIR=$HOME/.config/zsh
export EDITOR="vi"
export PATH="$HOME/.local/bin:$HOME/.local/scripts:$PATH"
export PATH="/snap/bin:$PATH"
export PATH="$(yarn global bin):$PATH" 2> /dev/null
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
export NVM_DIR="$HOME/.config/nvm"
export SHCOLOUR="14"
export ECHOCOLOUR="1;36"
if [ -f $ZDOTDIR/device/$(hostname).env ]; then
    . $ZDOTDIR/device/$(hostname).env
fi
