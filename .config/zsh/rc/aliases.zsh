# My Aliases
#
# alias -s suffix=tool
# alias -g global=can go anywhere in command
#
# Get this screen
alias aliases="$EDITOR $ZDOTDIR/rc/aliases.zsh"
alias rl="clear && source $ZDOTDIR/.zshrc"

# ls
alias l='\ls --color=auto -FX'
alias ls="l -lh"
alias la="ls -A"
alias le="ls -I"

# Ansible
alias a='ansible'
alias ap='ansible-playbook'
alias av='ansible-vault'

# Git
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
alias gi="git update-index --skip-worktree"
alias gr="git reset --soft HEAD~1"
alias gl="git log"
alias gca="git commit --amend --no-edit"
alias gg="gau; gc"
gc() {
    if [ "$1" != "" ]
    then
        git commit -m "$*"
    else
        git commit
    fi
}

# Dotfiles git
alias dots="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"
alias dfpl="dots pull"
alias dfps="dots push"
alias dfa="dots add"
alias dfau="dots add -u"
alias dfu="dots restore --staged"
alias dfch="dots checkout"
alias dfs="dots status"
alias dfd="dots diff"
alias dfi="dots update-index --skip-worktree"
alias dfr="dots reset --soft HEAD~1"
alias dfl="dots log"
alias dfca="dots commit --amend --no-edit"
alias dd="dfau; dfc"
dfc() {
    if [ "$1" != "" ]
    then
        dots commit -m "$*"
    else
        dots commit
    fi
}

# Colour
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Tmux
alias tmk='tmux kill-session -t'
alias tmkk='tmux kill-session'
alias update='tm update'
alias scripts='tm scripts || $EDITOR ~/.local/scripts/'
alias work='tm work'
config() {
  tm config $1 || $EDITOR ~/.config/$1
}

#Use XDG directories
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

# Misc
alias noise-cancelling='wget -qO - https://bit.ly/2mBJSJo | sudo bash && pulseaudio -k'
alias cx='chmod +x'
alias w='cd ~/Documents/work'
alias gip='curl icanhazip.com'
alias lip='ip -o route get to 1.1.1.1 | sed -n "s/.*src \([0-9.]\+\).*/\1/p"'
alias copy='xclip -selection clipboard <'
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
