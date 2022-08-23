# My Aliases
#
# alias -s suffix=tool
# alias -g global=can go anywhere in command
#
# Get this screen
alias aliases="$EDITOR $ZDOTDIR/rc/aliases.zsh"
alias rl="clear && source $ZDOTDIR/.zshrc"

#rc files
alias zrc="$EDITOR $ZDOTDIR/.zshrc"
alias nrc="$EDITOR ~/.config/nvim/init.lua"

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
gc() {
    if [ "$1" != "" ]
    then
        git commit -m "$*"
    else
        git commit
    fi
}
gg() {
    gau
    if [ "$1" != "" ]
    then
        gc $*
    else
        gc
    fi
}

# Dotfiles git
alias dots="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"
alias dpl="dots pull"
alias dps="dots push"
alias da="dots add"
alias dau="dots add -u"
alias du="dots restore --staged"
alias dch="dots checkout"
alias ds="dots status"
alias ddf="dots diff"
alias di="dots update-index --skip-worktree"
alias dr="dots reset --soft HEAD~1"
alias dl="dots log"
alias dca="dots commit --amend --no-edit"
dc() {
    if [ "$1" != "" ]
    then
        dots commit -m "$*"
    else
        dots commit
    fi
}
dd() {
    dau
    if [ "$1" != "" ]
    then
        dc $*
    else
        dc
    fi
}

# Colour
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Tmux
alias tmls='tmux list-sessions'
alias tmk='tmux kill-session -t'
alias tmkk='tmux kill-session'
alias update='tm update'
alias scripts='tm scripts || $EDITOR ~/.local/scripts/'
config() {
  tm config $1 || $EDITOR ~/.config/$1
}
alias work='tm work'

#Use XDG directories
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

# Misc
alias noise-cancelling='wget -qO - https://bit.ly/2mBJSJo | sudo bash && pulseaudio -k'
alias cx='chmod +x'
alias w='cd ~/Documents/work'
alias ww='cd ~/Documents/work-website'
alias gip='curl icanhazip.com'
alias lip='ip -o route get to 1.1.1.1 | sed -n "s/.*src \([0-9.]\+\).*/\1/p"'
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
