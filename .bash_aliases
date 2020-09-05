# My Aliases
# Get this screen
alias rc="vim ~/.zshrc && clear && source ~/.zshrc && echo 'Reloaded aliases'"
alias rcrl="clear && source ~/.zshrc && echo 'Reloaded aliases'"
alias aliases="vim ~/.bash_aliases && clear && source ~/.zshrc && echo 'Reloaded aliases'"
alias aliasesrl="rcrl"

# Git
alias gpl="git pull"
alias gps="git push"
alias ga="git add -u"
alias gaa="git add --all"
alias gc="git commit -m"
alias gch="git checkout"
alias gs="git status"

# Config
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias configbash="config add ~/.bash_aliases && echo 'added bash aliases'"
alias cpl="config pull"
alias cps="config push"
alias ca="config add -u"
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

if [ "`uname -r`" =~ "microsoft" ]
then
	# fix screen
	alias fixscreen="sudo /etc/init.d/screen-cleanup start"
	
	# SSHs 
	alias jackdaw="ssh root@192.168.1.4"
	alias black="ssh pi@192.168.1.2"
	alias red="ssh pi@192.168.1.3"
	alias blue="ssh pi@192.168.1.20"
	alias green="ssh pi@192.168.1.21"
	alias remote="ssh pi@rorynesbittdesign.com"
	
	# VPN
	alias vh="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command connect Home && echo 'Connecting to Home'"
	alias vhd="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command disconnect Home && echo 'Disconnecting'"
	alias vt="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command connect TryHackMe && echo 'Connecting to TryHackMe'"
	alias vtd="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command disconnect TryHackMe && echo 'Disconnecting from TryHackMe'"
	alias end="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command disconnect_all; exit"
	
	# desktop
	alias desktop="sudo /etc/init.d/xrdp start; sleep 1s; mstsc.exe /v localhost:3389; sleep 1s; sudo /etc/init.d/xrdp stop" 
	alias desktopstart="sudo /etc/init.d/xrdp start"
	alias desktopstop="sudo /etc/init.d/xrdp stop"
	
	# shutdown
	alias shutdown="shutdown.exe /s /t 00"
	alias reboot="shutdown.exe /r /t 00"
	alias bios="runas.exe /savecred /user:Administrator 'shutdown.exe /fw /r /t 00'"
fi


#######################################
# not alias stuff

echo "██████╗ ███╗   ██╗██████╗ 
██╔══██╗████╗  ██║██╔══██╗
██████╔╝██╔██╗ ██║██║  ██║
██╔══██╗██║╚██╗██║██║  ██║
██║  ██║██║ ╚████║██████╔╝
╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝" 
# neofetch || { sudo apt install neofetch -y && clear && neofetch ;}
