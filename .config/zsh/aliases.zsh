# My Aliases
#
# alias -s suffix=tool
# alias -g global=can go anywhere in command
#
# Get this screen
alias zrc="$EDITOR ~/.zshrc && clear && source ~/.zshrc && echo 'Reloaded zshrc'"
alias vrc="$EDITOR ~/.vim/vimrc"
alias rl="clear && source ~/.zshrc"
alias aliases="$EDITOR ~/.config/zsh/aliases.zsh && clear && source ~/.zshrc && echo 'Reloaded aliases'"
alias device="$EDITOR ~/.config/zsh/device.zsh && clear && source ~/.zshrc && echo 'Reloaded device customisation'"

# Git
alias gpl="git pull"
alias gps="git push"
alias ga="git add -u"
alias gaa="git add --all"
alias gch="git checkout"
alias gcl="git clone"
alias gs="git status"
alias gi="git update-index --skip-worktree"
gc() {
    if [ "$1" != "" ]
    then
        git commit -m "$*" && echo "Commited: $*"
    else
        git commit -m "Updated" && echo "Commited: Updated"
    fi
}


# Config
alias config="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"
alias cpl="config pull"
alias cps="config push"
alias ca="config add"
alias cau="config add -u"
alias caa="config add --all"
alias cch="config checkout"
alias cs="config status"
alias ci="config update-index --skip-worktree"

cc() {
    if [ "$1" != "" ]
    then
        config commit -m "$*" && echo "Commited: $*"
    else
        config commit -m "Updated" && echo "Commited: Updated"
    fi
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

# google drive
alias md="screen -dmS drive rclone mount drive: /home/rory/drive/ && echo 'Google Drive mounted'"
alias umd="screen -S drive -X stuff ^C && fusermount -u /home/rory/drive/ && echo 'Google Drive unmounted'"
alias uni="cd /home/rory/drive/Important\ stuff/Uni/Masters/"

# SSHs
alias jackdaw="ssh -q root@192.168.1.4"
alias red="ssh -q pi@192.168.1.3"
alias blue="ssh -q pi@192.168.1.20"
alias green="ssh -q pi@192.168.1.21"
alias black="ssh -q pi@192.168.1.22"
alias purple="ssh -q pi@192.168.1.23"
alias remote="ssh -q pi@ssh -q.rorynesbittdesign.com"

# Misc
alias :q='exit'
alias cx='chmod +x'
ndir() {
    mkdir $1
    cd $1
}
kdir() {
    PD=`pwd`
    cd ..
    rm -rf $PD
}

if [ "`uname -r`"=~"icrosoft" ]; then
	# fix screen
	alias fixscreen="sudo /etc/init.d/screen-cleanup start"

	# desktop

	desktop() {
		case "$1" in
			start)
				sudo /etc/init.d/xrdp start
				;;
			stop)
				sudo /etc/init.d/xrdp stop
				;;
			*)
				sudo /etc/init.d/xrdp start; sleep 1s; mstsc.exe /v localhost:3390; sleep 1s; sudo /etc/init.d/xrdp stop
				;;
		esac
	}

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
    BROWSR="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"

    alias -s com="$BROWSER"
    alias -s uk="$BROWSER"
    alias -s net="$BROWSR"

    search() {
        $BROWSR "https://www.startpage.com/do/dsearch?query=$*"
    }

fi
