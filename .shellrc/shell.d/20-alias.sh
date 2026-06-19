
alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"
alias ll='ls -l'
alias la='ls -la'
alias lg='lazygit'
alias psh='pwsh.exe'

# Fuzzy-find ssh commands from history.
s() {
  local cmd
  cmd=$(history | grep -E '^\s*[0-9]+\s+ssh\s' | sed 's/^[ ]*[0-9]*[ ]*//' | sort -u | fzf --height=~40% --prompt="ssh> ")

  if [ -n "$cmd" ]; then
    # Inject into history so after exiting ssh, up-arrow recalls the actual ssh command (not "s").
    if [ -n "$ZSH_VERSION" ]; then
      print -s "$cmd"
    else
      history -s "$cmd"
    fi

    eval "$cmd"
  fi
}

