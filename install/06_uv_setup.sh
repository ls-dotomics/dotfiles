#!/bin/bash
set -euo pipefail

echo "🐍 Setting up Python with uv..."

# Source bash profile to ensure uv is in PATH
source ~/.bash_profile

# Install Python 3.12 using uv
echo "📦 Installing Python 3.12..."
uv python install 3.12

# Uncomment the line below if you want to pin Python 3.12 as default
# uv python pin 3.12

echo "✅ Python setup complete!"