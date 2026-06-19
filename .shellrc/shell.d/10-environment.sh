
current_shell=''

if [ -n "$ZSH_VERSION" ]; then
  current_shell='zsh'
fi

if [ -n "$BASH_VERSION" ]; then
  current_shell='bash'
fi

# Add Homebrew path only on macOS
if [ "$(uname)" = "Darwin" ]; then
  # Add /opt/homebrew/bin to the PATH if it exists and isn't already there
  if [ -d /opt/homebrew/bin ]; then
    case ":$PATH:" in
      *:/opt/homebrew/bin:*) : ;;  # already in PATH
      *) PATH="$PATH:/opt/homebrew/bin" ;;
    esac
  fi

  export PATH

  # Homebrew by default prefixes the global PATH by adding an entry to /etc/paths
  # How /etc/paths works: https://unix.stackexchange.com/a/356720

  # Define a bash alias only if the current bash isn't from Homebrew
  # This is only for macOS because it ships a really old version of Bash
  current_bash="$(command -v bash 2>/dev/null || true)"
  homebrew_bash="/opt/homebrew/bin/bash"

  if [ "${current_bash}" != "${homebrew_bash}" ]; then
    alias bash="${homebrew_bash}"
  fi
fi

# Fast Node Manager: https://github.com/Schniz/fnm
if command -v fnm &>/dev/null; then
  if [ -n "$current_shell" ]; then
    eval "$(fnm env --use-on-cd --shell ${current_shell})"
  else
    eval "$(fnm env --use-on-cd)"
  fi
fi

# fzf: https://github.com/junegunn/fzf
if command -v fzf &>/dev/null; then
  # Dracula theme
  export FZF_DEFAULT_OPTS=$'--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9,fg+:#f8f8f2,bg+:#44475a
    --color=hl+:#bd93f9,info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
    --color=marker:#ff9ed4,spinner:#ffb86c,header:#6272a4,border:#6272a4
    --color=gutter:#44475a'
fi

