# Always open main tmux if not in a tmux or ssh session
if [ -z "$TMUX" ] && [ -z "$SSH_CLIENT" ]; then
    tmux attach -t main || tmux new -s main
    while true; do
        if tmux has-session -t main 2> /dev/null; then
            tmux attach-session -t main
        else
            tmux new -s main -d
            exit
        fi
    done
fi

setopt interactivecomments      # allow comments in interactive mode
setopt magicequalsubst          # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch                # hide error message if there is no match for the pattern
setopt notify                   # report the status of background jobs immediately
setopt numericglobsort          # sort filenames numerically when it makes sense
setopt promptsubst              # enable command substitution in prompt

# Misc
export PROMPT_EOL_MARK=""       # hide EOL sign
setopt autocd                   # change directory just by typing its name
set splitbelow                  # Open split bellow
set splitright                  # Open verticle split to the right

# Vim control
bindkey -v                                      # vim key bindings
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line                  # edit command in editor

# Completion
autoload -Uz compinit
compinit -d $ZDOTDIR/zcompdump
compinit
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

# History configurations
HISTFILE=$ZDOTDIR/zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first   # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups         # ignore duplicated commands history list
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_verify              # show command with history expansion to user before running it
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

precmd() {
#print ""                        # Print empty line before prompt
}

# Defaults
#echo -ne '\e[2 q'                # Set cursor
# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load files
for FILE ($ZDOTDIR/rc/*.zsh); do
  . $FILE
done
unset FILE

PROMPT="%F{$SHCOLOUR}$ %F{def}"
RPROMPT="%F{white}[%F{$SHCOLOUR}%~%F{white}]"

# Run neofetch/lolcat if installed and not in an ssh session
if [ -z "$SSH_CLIENT" ]; then
    if [ -f /bin/neofetch ] && [ -f /bin/lolcat ]; then
        neofetch --source ~/.config/zsh/img | lolcat
    elif [ -f /bin/neofetch ]; then
        neofetch --source ~/.config/zsh/img
    elif [ -f /bin/lolcat ]; then
        ( cat ~/.config/zsh/img && echo -e "`whoami`@`uname -n`" ) | lolcat
    else
        cat ~/.config/zsh/img && echo -e "\033[${ECHOCOLOUR}m`whoami`\033[1;37m@\033[${ECHOCOLOUR}m`uname -n`\033[1;37m"
    fi
fi
