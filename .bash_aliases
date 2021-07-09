# My Aliases
# Get this screen
alias rc="vim ~/.zshrc && clear && source ~/.zshrc && echo 'Reloaded zshrc'"
alias rcrl="clear && source ~/.zshrc && echo 'Reloaded zshrc'"
alias aliases="vim ~/.bash_aliases && clear && source ~/.zshrc && echo 'Reloaded aliases'"
alias aliasesrl="clear && source ~/.zshrc"
alias device="vim ~/.zsh_device && clear && source ~/.zshrc && echo 'Reloaded device customisation'"
alias devicerl="clear && source ~/.zshrc && echo 'Reloaded device customisation'"

# Git
alias gpl="git pull"
alias gps="git push"
alias ga="git add -u"
alias gaa="git add --all"
alias gc="git commit -m"
alias gch="git checkout"
alias gcl="git clone"
alias gs="git status"

# Config
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias cpl="config pull"
alias cps="config push"
alias ca="config add"
alias cau="config add -u"
alias caa="config add --all"
alias cc="config commit -m"
alias cch="config checkout"
alias cs="config status"

# ls
alias ls="ls --color=auto -lhF"
alias la="ls --color=auto -lhFa"

# google drive
alias md="screen -dmS drive rclone mount drive: /home/rory/drive/ && echo 'Google Drive mounted'"
alias umd="screen -S drive -X stuff ^C && fusermount -u /home/rory/drive/ && echo 'Google Drive unmounted'"
alias uni="cd /home/rory/drive/Important\ stuff/Uni/Masters/"

# SSHs 
alias jackdaw="ssh root@192.168.1.4"
alias red="ssh pi@192.168.1.3"
alias blue="ssh pi@192.168.1.20"
alias green="ssh pi@192.168.1.21"
alias black="ssh pi@192.168.1.22"
alias purple="ssh pi@192.168.1.23"
alias remote="ssh pi@ssh.rorynesbittdesign.com"

if [ "`uname -r`" =~ "icrosoft" ]; then
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
fi
