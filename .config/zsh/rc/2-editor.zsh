if (( $+commands[nvim] )); then
  export EDITOR="nvim"
  # Nvim as a man pager
  export MANPAGER="nvim +Man!"
  export MANWIDTH=999
elif (( $+commands[pvim] )); then
  export EDITOR="pvim"
elif (( $+commands[vim] )); then
  export EDITOR="vim"
elif (( $+commands[vi] )); then
  export EDITOR="vi"
fi
