#!/bin/bash
set -euo pipefail

echo "🚀 Starting dotfiles setup..."

# Request sudo upfront and keep it alive throughout the script
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Require Apple Silicon
if [[ "$(uname -m)" != "arm64" ]]; then
    echo "❌ This setup only supports Apple Silicon Macs. Detected: $(uname -m)"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$SCRIPT_DIR/macos-install"

# Make all install scripts executable
chmod +x "$INSTALL_DIR"/*.sh

echo "📦 Step 1/7: Installing Homebrew..."
bash "$INSTALL_DIR/01_install_homebrew.sh"

echo "🍺 Step 2/7: Installing Homebrew packages..."
bash "$INSTALL_DIR/02_install_brew_formulae_and_casks.sh"

echo "🛠️  Step 3/7: Installing utilities..."
bash "$INSTALL_DIR/03_install_utils.sh"

echo "🔗 Step 4/7: Setting up dotfiles symlinks..."
bash "$INSTALL_DIR/04_dotfiles_setup.sh"

echo "👤 Step 5/7: Configuring Git..."
bash "$INSTALL_DIR/05_git_setup.sh"

echo "🐍 Step 6/7: Setting up Python with uv..."
bash "$INSTALL_DIR/06_uv_setup.sh"

echo "🌟 Step 7/7: Setting up Starship..."
bash "$INSTALL_DIR/07_starship_setup.sh"

echo "🎉 Dotfiles setup complete!"
echo "Please restart your terminal or run 'source ~/.bash_profile' to apply changes."