# My Aliases
# Get this screen
alias aliases="vim ~/.bash_aliases && clear && source ~/.bashrc && echo 'Reloaded aliases'"
alias aliasesrl="clear && source ~/.bashrc && echo 'Reloaded aliases'"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias configadd="config add ~/.bash_aliases && config add ~/.config/awesome/rc.lua && echo 'added configs'"

# ls
alias ls="ls --color=auto -lhF"

# fix screen
alias fixscreen="sudo /etc/init.d/screen-cleanup start"

# google drive
alias md="screen -dmS drive rclone mount drive: /home/rory/drive/ && echo 'Google Drive mounted'"
alias umd="screen -S drive -X stuff ^C && fusermount -u /home/rory/drive/ && echo 'Google Drive unmounted'"
alias uni="cd /home/rory/drive/Important\ stuff/Uni/Masters/Term\ 2/"

# SSHs 
alias jackdaw="ssh root@192.168.1.4"
alias red="ssh pi@192.168.1.3"
alias blue="ssh pi@192.168.1.20"
alias green="ssh pi@192.168.1.21"
alias remote="ssh pi@rorynesbittdesign.com"

# VPN
alias vhome="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command connect Home && echo 'Connecting to Home'"
alias vhomedc="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command disconnect Home && echo 'Disconnecting'"
alias vthm="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command connect TryHackMe && echo 'Connecting to TryHackMe'"
alias vthmdc="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command disconnect TryHackMe && echo 'Disconnecting from TryHackMe'"
alias end="/mnt/c/Program\ Files/OpenVPN/bin/openvpn-gui.exe --command disconnect_all; exit"

# desktop
alias desktop="sudo /etc/init.d/xrdp start; sleep 1s; mstsc.exe /v localhost:3389; sleep 1s; sudo /etc/init.d/xrdp stop" 
alias desktopstart="sudo /etc/init.d/xrdp start"
alias desktopstop="sudo etc/init.d/xrdp stop"

# shutdown
alias shutdown="shutdown.exe /s /t 00"
alias reboot="shutdown.exe /r /t 00"
alias bios="runas.exe /savecred /user:Administrator 'shutdown.exe /fw /r /t 00'"



#######################################
# not alias stuff

echo "██████╗ ███╗   ██╗██████╗ 
██╔══██╗████╗  ██║██╔══██╗
██████╔╝██╔██╗ ██║██║  ██║
██╔══██╗██║╚██╗██║██║  ██║
██║  ██║██║ ╚████║██████╔╝
╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝" 
# neofetch || { sudo apt install neofetch -y && clear && neofetch ;}
