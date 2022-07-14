### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$ZINIT_HOME" && command chmod g-rwX "$ZINIT_HOME"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
#zinit light-mode for \
    #zinit-zsh/z-a-rust \
    #zinit-zsh/z-a-as-monitor \
    #zinit-zsh/z-a-patch-dl \
    #zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light-mode for \
    hlissner/zsh-autopair \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

# [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Syntax highlighting
# MUST BE LAST PLUGIN SOURCED
zinit light zdharma-continuum/fast-syntax-highlighting
