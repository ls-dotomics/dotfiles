#!/bin/bash
set -euo pipefail

echo "🍺 Installing Homebrew..."

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Set up Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Homebrew to shell profile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew installation failed"
    exit 1
else
    echo "✅ Homebrew successfully installed"
fi

# Install bash first since we'll use it as default shell
brew install bash

# Set bash path based on architecture
if [[ $(uname -m) == "arm64" ]]; then
    BASH_PATH="/opt/homebrew/bin/bash"
    echo "🍎 Apple Silicon Mac detected"
else
    BASH_PATH="/usr/local/bin/bash" 
    echo "🍎 Intel Mac detected"
fi

# Add to /etc/shells if bash exists and not already there
if [[ -f "$BASH_PATH" ]] && ! grep -q "^$BASH_PATH$" /etc/shells; then
    echo "$BASH_PATH" | sudo tee -a /etc/shells > /dev/null
    echo "✓ Added $BASH_PATH to /etc/shells"
fi

# Change default shell to Homebrew bash
chsh -s "$BASH_PATH"

echo "🎉 Homebrew setup complete!"