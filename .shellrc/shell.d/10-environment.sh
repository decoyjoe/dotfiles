
export EDITOR=vim

# Add Homebrew path only on macOS
if [ "$(uname)" = "Darwin" ]; then
  # Add /opt/homebrew/bin to the PATH if it exists and isn't already there
  if [ -d /opt/homebrew/bin ]; then
    case ":$PATH:" in
      *:/opt/homebrew/bin:*) : ;;  # already in PATH
      *) PATH="/opt/homebrew/bin:$PATH" ;;
    esac
  fi

  export PATH
fi
