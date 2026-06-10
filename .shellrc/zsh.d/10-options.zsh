
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands
setopt INTERACTIVE_COMMENTS      # Allow # comments in interactive shell
setopt NO_AUTO_MENU              # Don't cycle through completions on tab
setopt NO_LIST_AMBIGUOUS         # Always list immediately when ambiguous
setopt NO_LIST_BEEP              # Don't beep on ambiguous completion
setopt BASH_AUTO_LIST            # List on second tab press

# Clear the completions after a unique result was completed
_tab_complete() {
  zle expand-or-complete
  zle reset-prompt
}
zle -N _tab_complete
bindkey '^I' _tab_complete

# Explicity enable Emacs-like mode, to avoid accidentally entering Vi-like mode based on the environment.
bindkey -e

# Bind alt-left and alt-right to word movement
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# Do the same for ctrl-left/ctrl-right as well (for Linux and Windows platforms)
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Prefix-based history search with arrow keys
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

## Bind arrow keys
bindkey '^[[A' up-line-or-beginning-search    # Up arrow
bindkey '^[[B' down-line-or-beginning-search  # Down arrow

## Also bind for terminals that send different codes
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

