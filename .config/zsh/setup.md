## dotfiles setup commands

```sh
git init --bare ~/.config/dotfiles git@guthub.com:RoryNesbitt/dotfiles
alias dots="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"
dots checkout
```
