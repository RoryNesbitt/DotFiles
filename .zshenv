ZDOTDIR=$HOME/.config/zsh
export EDITOR="vi"
export NVM_DIR="$HOME/.config/nvm"
export SHCOLOUR="14"
export ECHOCOLOUR="1;36"

dirs=("$HOME/.local/bin"
  "$HOME/.local/scripts"
  "$HOME/.local/pvim"
  "/snap/bin"
  "/home/linuxbrew/.linuxbrew/bin"
  "/home/linuxbrew/.linuxbrew/sbin"
)
for dir in $dirs; do
  if [ -d $dir ]; then
    export PATH="$dir:$PATH"
  fi
done

if [ -f $ZDOTDIR/device/$(hostname).env ]; then
    . $ZDOTDIR/device/$(hostname).env
fi
