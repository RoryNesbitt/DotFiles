export ZDOTDIR=$HOME/.config/zsh
export SHCOLOUR="14"
export ECHOCOLOUR="1;36"
export EDITOR="vi"

if [ -f $ZDOTDIR/device/$(hostname).env ]; then
  source $ZDOTDIR/device/$(hostname).env
fi

export RGB_SHCOLOUR="$($HOME/.local/scripts/colours $SHCOLOUR)"

#clearing up $HOME
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export ANDROID_HOME="$XDG_DATA_HOME"/android
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export PYLINTHOME="${XDG_CACHE_HOME}/pylint"
export PYTHON_HISTORY="$XDG_CACHE_HOME/python/python_history"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export NVM_DIR="$HOME/.config/nvm"
export GOPATH="$XDG_DATA_HOME/go"
