setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt autocd              # change directory just by typing its name
export PROMPT_EOL_MARK=""  # hide EOL sign

# Completion
autoload -Uz compinit
compinit -d $ZDOTDIR/zcompdump
compinit
zstyle ":completion:*:*:*:*:*" menu select
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" # case insensitive tab completion

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#Prompt
precmd() {
  local exitCode=$?

  local pwd="%F{$SHCOLOUR}%~%f"
  case $exitCode in
    0) EXIT_STATUS_PROMPT="" ;;                               # success
    126|127) EXIT_STATUS_PROMPT="[%F{blue}${exitCode}%f] " ;; # file issue
    129|130|131|137|139|141|143)                              # signal terminated
      signal=$(( exitCode-128 ))
      signalName=$(kill -l $signal)
      EXIT_STATUS_PROMPT="[%F{yellow}$exitCode-SIG${signalName}%f] "
      ;;
    255) EXIT_STATUS_PROMPT="[%F{magenta}${exitCode}%f] " ;;  # SSH error
    *) EXIT_STATUS_PROMPT="[%F{red}${exitCode}%f] " ;;        # generic error
  esac
}

PROMPT='${EXIT_STATUS_PROMPT}%F{$SHCOLOUR}> %F{def}'
RPROMPT=""

# Vim control
bindkey -v # vim key bindings
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey -M vicmd 'vv' edit-command-line
