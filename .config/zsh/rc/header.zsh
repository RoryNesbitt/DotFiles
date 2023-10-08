# Run neofetch/lolcat if installed and not in an ssh session
if [ -z "$SSH_CLIENT" ] || [ "$TMUX" ]; then
  if [ -f /bin/neofetch ] && [ -f /bin/lolcat ]; then
    neofetch --source ~/.config/zsh/img | lolcat
  elif [ -f /bin/neofetch ]; then
    neofetch --source ~/.config/zsh/img
  elif [ -f /bin/lolcat ]; then
    (cat ~/.config/zsh/img && echo -e "$(whoami)@$(uname -n)") | lolcat
  else
    cat ~/.config/zsh/img && echo -e "\033[${ECHOCOLOUR}m$(whoami)\033[1;37m@\033[${ECHOCOLOUR}m$(uname -n)\033[1;37m"
  fi
fi
