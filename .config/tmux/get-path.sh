#!/usr/bin/env sh

p=$1

case $p in
"$HOME"*) p="~${p#"$HOME"}" ;;
esac

if [ ${#p} -le 24 ]; then
  printf '%s' "$p"
else
  printf '…/%s/%s' "$(basename "$(dirname "$p")")" "$(basename "$p")"
fi
