
# dotfiles

Personal dotfiles in a `$HOME/.dotfiles` bare Git repository with a `dotfiles`
command alias to interact with the dotfiles repo.

## Install

```shell
cd $HOME
git clone --bare git@github.com:decoyjoe/dotfiles.git $HOME/.dotfiles
echo 'alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"' >> ~/.bash_aliases
source ~/.bash_aliases

# Use environment variables if they exist; otherwise prompt the user
email="${DOTFILES_EMAIL:-}"
first_last="${DOTFILES_FIRST_LAST:-}"

if [ -z "$email" ]; then
  read -p 'Enter your Email address: ' email
fi

if [ -z "$first_last" ]; then
  read -p 'Enter your First and Last name: ' first_last
fi

dotfiles config --local user.email "$email"
dotfiles config --local user.name "$first_last"
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

