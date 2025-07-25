#!/bin/bash
set -euo pipefail

if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Create symlinks to starship config file
ln -sf "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
