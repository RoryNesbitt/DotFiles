dirs=("$HOME/.local/bin"
  "$HOME/.local/scripts"
  "$HOME/.local/pvim"
  "/snap/bin"
  "/home/linuxbrew/.linuxbrew/bin"
  "/home/linuxbrew/.linuxbrew/sbin"
  "$HOME/Documents/projects/dotfyle-cli"
)
for dir in $dirs; do
  if [ -d $dir ]; then
    export PATH="$dir:$PATH"
  fi
done

