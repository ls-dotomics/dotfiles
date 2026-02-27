#!/bin/bash
set -euo pipefail

echo "🛠️  Installing additional utilities..."

echo "📦 Installing ble.sh (bash line editor)..."
git clone https://github.com/akinomyoga/ble.sh.git /tmp/blesh-build
cd /tmp/blesh-build
make
make install PREFIX=~/.local
cd ~/
rm -rf /tmp/blesh-build

echo "🐍 Installing uv (Python package manager)..."
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env

echo "✅ Utilities installed successfully!"