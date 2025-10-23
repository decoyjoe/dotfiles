
# Explicity enable Emacs-like mode, to avoid accidentally entering Vi-like mode based on the environment.
bindkey -e

# Bind alt-left and alt-right to word movement
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
# Do the same for ctrl-left/ctrl-right as well (for Linux and Windows platforms)
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

