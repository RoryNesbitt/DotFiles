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

# Git
alias g="git"
alias gpl="git pull"
alias gps="git push"
alias ga="git add"
alias gau="git add -u"
alias gaa="git add --all"
alias gu="git restore --staged"
alias gch="git checkout"
alias gcl="git clone"
alias gs="git status"
alias gd="git diff"
alias gr="git reset --soft HEAD~1"
alias gl="git log --oneline --decorate --graph"
alias gst="git stash"
alias gsp="git stash pop"
alias gca="git commit --amend --no-edit"
alias gg="gau; gc"
gc() {
  if [ "$1" != "" ]; then
    git commit -m "$*"
  else
    git commit
  fi
}

# Dotfiles git
alias df="git -C $HOME/.config/dotfiles"
alias dfpl="df pull"
alias dfps="df push"
alias dfa="df add"
alias dfaa="df add --all"
alias dfau="df add -u"
alias dfu="df restore --staged"
alias dfch="df checkout"
alias dfs="df status"
alias dfd="df diff"
alias dfr="df reset --soft HEAD~1"
alias dfl="df log --oneline --decorate --graph"
alias dfst="df stash"
alias dfsp="df stash pop"
alias dfca="df commit --amend --no-edit"
alias dd="dfau; dfc"
dfc() {
  if [ "$1" != "" ]; then
    df commit -m "$*"
  else
    df commit
  fi
}

# Docker
alias d="docker"
alias db="docker build"
alias dr="docker restart"
alias ds="docker ps"
alias dl="docker logs"
alias dsa="docker ps -a"
alias dsq="docker ps -q"
alias dcu="docker compose up -d"
alias dcd="docker compose down"

# Colour
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"
alias ip="ip --color=auto"

# Tmux
alias tmk="tmux kill-session -t"
alias update="tm update || fullUpdate"
alias scripts="tm scripts || $EDITOR ~/.local/scripts/"
alias papers="tm papers || $EDITOR ~/Documents/papers/"

#Use XDG directories
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

#Get data
alias gip="curl icanhazip.com"
alias lip="ip -o route get to 1.1.1.1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p'"
alias copy="xclip -selection clipboard <"
alias window-class="xprop | grep CLASS"

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
alias cx="chmod +x"
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
