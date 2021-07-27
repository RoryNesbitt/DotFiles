#setopt interactivecomments      # allow comments in interactive mode
#setopt ksharrays                # arrays start at 0
#setopt magicequalsubst          # enable filename expansion for arguments of the form ‘anything=expression’
#setopt nonomatch                # hide error message if there is no match for the pattern
#setopt notify                   # report the status of background jobs immediately
#setopt numericglobsort          # sort filenames numerically when it makes sense
#setopt promptsubst              # enable command substitution in prompt

# Misc
export PROMPT_EOL_MARK=""       # hide EOL sign
setopt autocd                   # change directory just by typing its name
set splitbelow                  # Open split bellow
set splitright                  # Open verticle split to the right

# Keybindings
bindkey -v                                        # vim key bindings
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[C' forward-word                       # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[D' backward-word                      # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down

# Completion
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first   # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups         # ignore duplicated commands history list
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_verify              # show command with history expansion to user before running it

precmd() {
print ""                                # Print empty line before prompt
}

# Defaults
echo -ne '\e[2 q'               # Set cursor
export EDITOR="vim"             # Set editor to Vim
export PATH="$HOME/.scripts:$PATH"
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load files
for FILE (~/.zsh/*.zsh); do
  . $FILE
done
unset FILE

PROMPT="%F{$SHCOLOUR}$ %F{def}"
RPROMPT="%F{white}[%F{$SHCOLOUR}%~%F{white}]"

neofetch --source ~/.zsh/img 2>/dev/null || ( cat ~/.zsh/img && echo -e "\033[${SHCOLOURN}m`whoami`\033[1;37m@\033[${SHCOLOURN}m`uname -n`\033[1;37m" )
