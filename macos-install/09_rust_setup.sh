#!/bin/bash
set -euo pipefail

echo "🦀 Installing Rust via rustup..."

# Install rustup (Rust toolchain installer)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source cargo environment so rust tools are available immediately
source "$HOME/.cargo/env"

# Verify installation
if ! command -v rustc &> /dev/null; then
    echo "❌ Rust installation failed"
    exit 1
fi

echo "✅ Rust setup complete! (rustc $(rustc --version | awk '{print $2}'))"
