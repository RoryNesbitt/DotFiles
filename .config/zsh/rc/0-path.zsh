dirs=("$HOME/.local/bin"
  "$HOME/.local/scripts"
  "$HOME/.local/pvim"
  "/snap/bin"
  "/home/linuxbrew/.linuxbrew/bin"
  "/home/linuxbrew/.linuxbrew/sbin"
)
for dir in $dirs; do
  if [ -d $dir ]; then
    export PATH="$dir:$PATH"
  fi
done

