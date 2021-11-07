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

# Git
alias gpl="git pull"
alias gps="git push"
alias ga="git add"
alias gau="git add -u"
alias gaa="git add --all"
alias gch="git checkout"
alias gcl="git clone"
alias gs="git status"
alias gd="git diff"
alias gi="git update-index --skip-worktree"
alias gr="git reset --soft HEAD~1"
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
alias dch="dots checkout"
alias ds="dots status"
alias ddf="dots diff"
alias di="dots update-index --skip-worktree"
alias dr="dots reset --soft HEAD~1"
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

# SSHs
alias jackdaw="ssh -q root@192.168.1.4"
alias red="ssh -q pi@192.168.1.3"
alias blue="ssh -q pi@192.168.1.20"
alias green="ssh -q pi@192.168.1.21"
alias black="ssh -q pi@192.168.1.22"
alias purple="ssh -q pi@192.168.1.23"
alias work-pi="ssh -q pi@192.168.8.100 -t zsh"
alias work-server="ssh labadmin@10.192.31.7 -t zsh"
alias work-db="ssh -q labadmin@10.192.31.13 -t mongo RFIOD"

# Tmux
alias tmls='tmux list-sessions'
alias tmk='tmux kill-session -t'
alias tmkk='tmux kill-session'
alias scripts='tm scripts'
alias config='tm config'
alias work='tm work'
alias work2='tm work2'

# Misc
alias noise-cancelling='wget -qO - https://bit.ly/2mBJSJo | sudo bash && pulseaudio -k'
alias cx='chmod +x'
alias w='cd ~/Documents/work'
alias ww='cd ~/Documents/work-website'
alias myip='curl icanhazip.com'
ndir() {
    mkdir $1
    cd $1
}
kdir() {
    PD=`pwd`
    cd ..
    rm -rf $PD
}

alias -s com="$BROWSER"
alias -s uk="$BROWSER"
alias -s net="$BROWSER"

search() {
    $BROWSER "https://www.startpage.com/do/dsearch?query=$*"
}

