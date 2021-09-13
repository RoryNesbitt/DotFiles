# My Aliases
#
# alias -s suffix=tool
# alias -g global=can go anywhere in command
#
# Get this screen
alias aliases="$EDITOR ~/.config/zsh/aliases.zsh"
alias rl="clear && source ~/.zshrc"

#rc files
alias zrc="$EDITOR ~/.zshrc"
alias vrc="$EDITOR ~/.vim/vimrc"
alias nrc="$EDITOR ~/.config/nvim/init.vim"
config() {
    $EDITOR ~/.config/$1
}

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
        git commit -m "$*" && echo "Commited: $*"
    else
        git commit -m "Updated" && echo "Commited: Updated"
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
    gps
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
        dots commit -m "$*" && echo "Commited: $*"
    else
        dots commit -m "Updated" && echo "Commited: Updated"
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
    dps
}

# ls
alias ls="ls --color=auto -lhFX"
alias la="ls -A"
alias le="ls -I"

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
alias work-server="ssh -q labadmin@10.192.31.13"
alias work-db="ssh -q labadmin@10.192.31.13 -t mongo RFIOD"

# Misc
alias :q='exit'
alias cx='chmod +x'
alias w='cd ~/Documents/work'
alias ww='cd ~/Documents/work-website'
alias myip="echo $(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')"
ndir() {
    mkdir $1
    cd $1
}
kdir() {
    PD=`pwd`
    cd ..
    rm -rf $PD
}

if [[ "`uname -r`" =~ "icrosoft" ]]; then
	# shutdown
	alias shutdown="shutdown.exe /s /t 00"
	alias reboot="shutdown.exe /r /t 00"
	alias bios="runas.exe /savecred /user:Administrator 'shutdown.exe /fw /r /t 00'"

    # mount other drives
    mnt() {
        sudo mkdir /mnt/$1
        sudo mount -t drvfs $1\: /mnt/$1
    }

    umnt() {
        sudo umount /mnt/$1
        sudo rmdir /mnt/$1
    }

    # Browser
    BROWSER="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
    
fi

alias -s com="$BROWSER"
alias -s uk="$BROWSER"
alias -s net="$BROWSER"

search() {
    $BROWSER "https://www.startpage.com/do/dsearch?query=$*"
}

