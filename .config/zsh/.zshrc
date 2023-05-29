# Load files
for FILE ($ZDOTDIR/rc/*.zsh); do
  source $FILE
done
unset FILE
