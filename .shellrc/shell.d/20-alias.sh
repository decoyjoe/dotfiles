
alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"
alias ll='ls -l'
alias la='ls -la'
alias lg='lazygit'
alias psh='pwsh.exe'

# Portable `tac` replacement (macOS doesn't ship GNU coreutils' tac).
if ! command -v tac >/dev/null 2>&1; then
  tac() {
    awk '{a[NR]=$0} END {for (i=NR; i > 0; i--) print a[i]}'
  }
fi

# Fuzzy-find ssh commands from history.
s() {
  local cmd raw

  if [ -n "$ZSH_VERSION" ]; then
    raw=$(fc -l 1)
  else
    raw=$(history)
  fi

  cmd=$(
    printf '%s\n' "$raw"                                         | # Emit history as lines.
    grep -E '^[[:space:]]*[0-9]+[[:space:]]+ssh[[:space:]]'      | # Keep only history lines that start with ssh.
    sed 's/^[[:space:]]*[0-9]*[[:space:]]*//'                    | # Strip history line numbers/prefix.
    grep -Ev '^ssh[[:space:]]+-([hVQ]|G([[:space:]]|$))'         | # Exclude ssh utility calls (-h/-V/-Q/-G).
    tac                                                          | # Reverse to newest-first for dedupe.
    awk '!seen[$0]++'                                            | # Keep first occurrence (most recent exact command).
    tac                                                          | # Return to chronological order.
    fzf +s --tac --layout=reverse --height=~40% --prompt="ssh> "   # Preserve order and preferred fzf display.
  )

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
