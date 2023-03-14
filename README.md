
# dotfiles

Personal dotfiles in a `$HOME/.dotfiles` bare Git repository with a `dotfiles`
command alias to interact with the dotfiles repo.

## Install

```shell
cd $HOME
git clone --bare git@github.com:decoyjoe/dotfiles.git $HOME/.dotfiles
echo 'alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"' >> ~/.bash_aliases
source ~/.bash_aliases
dotfiles config --local user.email decoyjoe@gmail.com
dotfiles config --local user.name "Joseph Larionov"
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
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

