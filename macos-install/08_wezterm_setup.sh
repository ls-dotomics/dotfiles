#!/bin/bash
set -euo pipefail

echo "🔗 Setting up Wezterm symlink..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Create symlinks to dotfiles
ln -sf "$DOTFILES_DIR/wezterm.lua" "$HOME/.wezterm.lua"

echo "✅ Wezterm symlink created successfully!"