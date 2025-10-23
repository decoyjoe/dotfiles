
enable_prompt=true

# Skip oh-my-posh setup if in Apple Terminal (ANSI issues)
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
  echo "Warning: Apple Terminal has limited ANSI support. Skipping custom prompt."
  enable_prompt=false
fi

# Check if oh-my-posh is installed
if ! command -v oh-my-posh >/dev/null 2>&1; then
  echo "Warning: oh-my-posh is not installed. Skipping custom prompt."
  enable_prompt=false
fi

# Only apply the prompt if everything checks out
if $enable_prompt; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/joe.pure.yaml)"
fi
