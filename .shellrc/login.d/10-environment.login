
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    case ":$PATH:" in
      *:"$HOME/bin":*) : ;;  # already in PATH
      *) PATH="$PATH:$HOME/bin" ;;
    esac
    
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    case ":$PATH:" in
      *:"$HOME/.local/bin":*) : ;;  # already in PATH
      *) PATH="$PATH:$HOME/.local/bin" ;;
    esac
fi

# Add linuxbrew to the path on Linux systems
if [ "$(uname)" = "Linux" -a -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    case ":$PATH:" in
      *:/home/linuxbrew/.linuxbrew/bin:*) : ;;  # already in PATH
      *) eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" ;;
    esac
fi

