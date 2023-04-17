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

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

#clearing up $HOME
export ANDROID_HOME="$XDG_DATA_HOME"/android
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export PYLINTHOME="${XDG_CACHE_HOME}/pylint"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export WINEPREFIX="$XDG_DATA_HOME/wine"

