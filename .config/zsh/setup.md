## dotfiles setup commands

```sh
git init --bare ~/.config/dotfiles git@guthub.com:RoryNesbitt/dotfiles
alias dots="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"
dots checkout
dots config --local status.showUntrackedFiles no
dots remote add origin git@github.com:RoryNesbitt/DotFiles.git
dots push --set-upstream origin master
```
