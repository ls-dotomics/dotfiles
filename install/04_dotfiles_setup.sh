#!/bin/bash
set -euo pipefail

echo "🔗 Setting up dotfiles symlinks..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Create symlinks to dotfiles
ln -sf "$DOTFILES_DIR/bash_profile" ~/.bash_profile
ln -sf "$DOTFILES_DIR/bashrc" ~/.bashrc
ln -sf "$DOTFILES_DIR/bash_aliases" ~/.bash_aliases
ln -sf "$DOTFILES_DIR/blerc" ~/.blerc
ln -sf "$DOTFILES_DIR/gitconfig" ~/.gitconfig

echo "✅ Dotfiles symlinks created successfully!"