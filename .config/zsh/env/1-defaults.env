# Editor
if (( $+commands[nvim] )); then
  export EDITOR="nvim"
  # Nvim as a man pager
  export MANPAGER="nvim +Man!"
  export MANWIDTH=999
elif (( $+commands[pvim] )); then
  export EDITOR="pvim"
  export MANPAGER="pvim +Man!"
elif (( $+commands[vim] )); then
  export EDITOR="vim"
elif (( $+commands[vi] )); then
  export EDITOR="vi"
fi

# Browser
if (( $+commands[waterfox] )); then
  export BROWSER="waterfox"
elif (( $+commands[firefox] )); then
  export BROWSER="firefox"
fi
