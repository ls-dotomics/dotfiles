export PATH="/opt/homebrew/share/google-cloud-sdk/bin:/opt/homebrew/bin:$HOME/.local/bin:/Library/TeX/texbin:$HOME/bin:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export LANG=en_US.UTF-8
hash -r

# Source .bashrc for interactive shells
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi
. "$HOME/.cargo/env"

# Added by Antigravity
export PATH="/Users/lstrouk/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/lstrouk/.antigravity/antigravity/bin:$PATH"
