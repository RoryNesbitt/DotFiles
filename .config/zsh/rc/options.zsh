setopt interactivecomments      # allow comments in interactive mode
setopt magicequalsubst          # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch                # hide error message if there is no match for the pattern
setopt notify                   # report the status of background jobs immediately
setopt numericglobsort          # sort filenames numerically when it makes sense
setopt promptsubst              # enable command substitution in prompt
setopt autocd                   # change directory just by typing its name
export PROMPT_EOL_MARK=""       # hide EOL sign

# Completion
autoload -Uz compinit
compinit -d $ZDOTDIR/zcompdump
compinit
zstyle ":completion:*:*:*:*:*" menu select
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" # case insensitive tab completion

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Prompt
precmd() {
#print ""                        # Print empty line before prompt
}

PROMPT="%F{$SHCOLOUR}> %F{def}"
RPROMPT="%F{white}[%F{$SHCOLOUR}%~%F{white}]"

# Vim control
bindkey -v                                      # vim key bindings
autoload edit-command-line; zle -N edit-command-line
bindkey "^E" edit-command-line                  # edit command in editor
