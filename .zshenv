export ZDOTDIR=$HOME/.config/zsh
# Load files
for FILE ($ZDOTDIR/env/*.env); do
  source $FILE
done
unset FILE
