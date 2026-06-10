
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000

shopt -s histappend   # append to the history file, don't overwrite it
shopt -s cmdhist      # Save multi-line commands as one entry
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkjobs    # Warn about running jobs before exit

# Write each command to history immediately AND reload from file
# This is the key line for shared, immediate history across sessions
PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"

# Prefix-based history search with arrow keys
bind '"\e[A": history-search-backward'   # Up arrow
bind '"\e[B": history-search-forward'    # Down arrow

# For terminals using alternative escape sequences
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[[ $- == *i* ]] && stty -ixon # Disable XON/XOFF for interactive shells

