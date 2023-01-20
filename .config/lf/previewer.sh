#!/usr/bin/env sh

preview() {
	cat <<-EOF | paste -sd '' >"$LF_UEBERZUG_TEMPDIR/fifo"
	{
	"action": "add", "identifier": "lf-preview",
	"path": "$1", "x": $4, "y": $5, "width": $2, "height": $3,
	"scaler": "contain"
	}
	EOF
}

file="$1"; shift
case "$(basename "$file" | tr '[:upper:]' '[:lower:]')" in
*.tar*) tar tf "$file" ;;
*.zip) unzip -l "$file" ;;
*.rar) unrar l "$file" ;;
*.7z) 7z l "$file" ;;
*.avi|*.mp4|*.mkv)
	thumbnail="$LF_UEBERZUG_TEMPDIR/thumbnail.png"
	ffmpeg -y -i "$file" -vframes 1 "$thumbnail"
	preview "$thumbnail" "$@"
	;;
*.pdf)
	thumbnail="$LF_UEBERZUG_TEMPDIR/thumbnail.png"
	gs -o "$thumbnail" -sDEVICE=pngalpha -dLastPage=1 "$file" >/dev/null
	preview "$thumbnail" "$@"
	;;
*.jpg|*.jpeg|*.png|*.bmp)
	preview "$file" "$@" ;;
*.svg)
	thumbnail="$LF_UEBERZUG_TEMPDIR/thumbnail.png"
	gm convert "$file" "$thumbnail"
	preview "$thumbnail" "$@"
	;;
*.gif)
	thumbnail="$LF_UEBERZUG_TEMPDIR/thumbnail.png"
	gm convert "$file[0]" "$thumbnail"
	preview "$thumbnail" "$@"
	;;
*) 
  if command -v nvim 1>/dev/null 2>1; then
    nvim -c "so ~/.config/lf/nvim.lua" "$file"
  elif command -v bat 1>/dev/null 2>1; then
    bat -pf "$file"
  else
    cat "$file"
  fi
  ;;
esac
return 127 # nonzero retcode required for lf previews to reload
