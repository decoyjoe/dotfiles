
# ~/.profile is not read by bash(1) if ~/.bash_profile or ~/.bash_login exist.
# So we source .profile ourselves, which then sources .bashrc.

if [ -f "$HOME/.profile" ]; then
. "$HOME/.profile"
fi

