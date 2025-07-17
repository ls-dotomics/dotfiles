export PATH="/opt/homebrew/bin:$HOME/.local/bin:$PATH"

export LANG=en_US.UTF-8
hash -r

# Source .bashrc for interactive shells
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi
