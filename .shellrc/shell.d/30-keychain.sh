
# If you're running WSL2 and keychain isn't working (i.e. ssh-add can't find the socket file)
# it may be due to this WSL2 bug: https://github.com/microsoft/WSL/issues/11857

eval $(keychain --eval --noask --quiet)

# Make sure SSH is configured to add keys to ssh-agent
if [ ! -f ~/.ssh/config ] || ! grep -q '^AddKeysToAgent yes' ~/.ssh/config; then
  mkdir -p ~/.ssh
  echo 'AddKeysToAgent yes' >> ~/.ssh/config
fi
