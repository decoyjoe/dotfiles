
enable_prompt=true

if [ -n "$ZSH_VERSION" ]; then
  shell_name='zsh'
fi

if [ -n "$BASH_VERSION" ]; then
  shell_name='bash'

  # Check for Bash version compatibility (oh-my-posh needs >= 4.2)
  if [ "${BASH_VERSINFO[0]}" -lt 4 ] || { [ "${BASH_VERSINFO[0]}" -eq 4 ] && [ "${BASH_VERSINFO[1]}" -lt 2 ]; }; then
    echo "Warning: Bash version ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]} is below minimum required version 4.2. Skipping custom prompt."
    enable_prompt=false
  fi
fi

# Skip oh-my-posh setup if in Apple Terminal (ANSI issues)
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
  echo "Warning: Apple Terminal has limited ANSI support. Skipping custom prompt."
  enable_prompt=false
fi

# Check if oh-my-posh is installed
if ! command -v oh-my-posh >/dev/null 2>&1; then
	echo "Warning: oh-my-posh is not installed (run \"brew install jandedobbeleer/oh-my-posh/oh-my-posh\" to install it). Skipping custom prompt."
  enable_prompt=false
fi

# Only apply the prompt if everything checks out
if $enable_prompt; then
  eval "$(oh-my-posh init ${shell_name} --config ~/.config/oh-my-posh/joe.pure.yaml)"
fi

unset enable_prompt
unset shell_name
