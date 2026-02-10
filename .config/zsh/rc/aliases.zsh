# My Aliases
#
# alias -s suffix=tool
# alias -g global=can go anywhere in command
#
alias rl="clear && source $ZDOTDIR/.zshrc"

# Editor
alias v="$EDITOR"
alias v.="v ."

# ls
alias l="\ls --color=auto -FX"
alias ls="l -lh"
alias la="ls -A"
alias ld="ls -t"
alias lad="ls -At"

# Ansible
alias a="ansible"
alias ap="ansible-playbook"
alias av="ansible-vault"

# Dotfiles git
alias dots="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"

# Colour
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"
alias ip="ip --color=auto"

# Tmux
alias tmk="tmux kill-session -t"
alias update="tm update || fullUpdate"
alias papers="tm papers || $EDITOR ~/Documents/papers/"
config() { tm config "$@" || "$EDITOR" "$HOME/.config/$@" }
scripts() { tm scripts "$@" || "$EDITOR" "$HOME/.local/scripts/$@" }

#Use XDG directories
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

#Get data
alias gip="curl icanhazip.com"
alias lip="ip -o route get to 1.1.1.1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p'"
alias window-class="xprop | grep CLASS"
copy() {
  [ $(command -v xclip) ] && xclip -selection clipboard < $@
  [ $(command -v wl-copy) ] && wl-copy < $@
}

#lf
alias lf="lf-img"
lf-img() {
  LF_TEMPDIR="$(mktemp -d -t lf-shellcd-XXXXXX)"
  export LF_TEMPDIR
  mkfifo "$LF_TEMPDIR/fifo"
  (tail -f "$LF_TEMPDIR/fifo" | ueberzug layer --silent &>/dev/null &) >/dev/null
  UEBERZUGPID=$!
  \lf -last-dir-path "$LF_TEMPDIR/lastdir" $@
  if [ -e "$LF_TEMPDIR/changecwd" ] &&
    dir="$(cat "$LF_TEMPDIR/lastdir")" 2>/dev/null; then
    cd "$dir"
  fi
  kill "$UEBERZUGPID"
  pkill -f "tail -f $LF_TEMPDIR/fifo" &>/dev/null
  rm -rf "$LF_TEMPDIR"
  unset LF_TEMPDIR
}

# Arduino
arduino-upload() {
  arduino-cli compile --fqbn arduino:avr:leonardo $1
  arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:leonardo $1
}

# Misc
alias nb="newsboat"
ndir() {
  mkdir $1
  cd $1
}
kdir() {
  PD=${PWD##*/}
  cd ..
  rm -rf $PD
  echo Killed $PD
}
uz() {
  if unzip $@; then
    rm $@
  fi
}
