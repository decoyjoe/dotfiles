
# dotfiles

Personal dotfiles in a `$HOME/.dotfiles` bare Git repository with a `dotfiles`
command alias to interact with the dotfiles repo.

## Install

```shell
cd "$HOME"
git clone --bare git@github.com:decoyjoe/dotfiles.git "$HOME/.dotfiles"
alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"

email="${DOTFILES_EMAIL:-}"
first_last="${DOTFILES_FIRST_LAST:-}"

if [ -z "$email" ]; then
  printf 'Enter your Email address: '
  IFS= read -r email
fi

if [ -z "$first_last" ]; then
  printf 'Enter your First and Last name: '
  IFS= read -r first_last
fi

dotfiles config --local user.email "$email"
dotfiles config --local user.name "$first_last"
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout

ln -sfn "$HOME/.shellrc/profile"      "$HOME/.profile"
ln -sfn "$HOME/.shellrc/bash_profile" "$HOME/.bash_profile"
ln -sfn "$HOME/.shellrc/bashrc"       "$HOME/.bashrc"

ln -sfn "$HOME/.shellrc/zprofile"     "$HOME/.zprofile"
ln -sfn "$HOME/.shellrc/zshrc"        "$HOME/.zshrc"
```

## Usage

`dotfiles` is an alias that runs `git` commands within your dotfiles repo.

```console
$ dotfiles status
$ dotfiles add .config/app/config.yml
$ dotfiles commit -m 'Add config.yml'
$ dotfiles push
```

_Note: Since we set `status.showUntrackedFiles = no`, new, never-committed files
won't show up in `dotfiles status` until you `dotfiles add` them._

