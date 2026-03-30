#!/bin/bash
set -euo pipefail

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
else
    echo "Homebrew successfully installed."
fi

# Helper: install a cask only if not already installed
brew_cask() {
  if brew list --cask "$1" &>/dev/null; then
    echo "✓ $1 already installed, skipping"
  else
    brew install --cask "$1"
  fi
}

# Helper: install a formula only if not already installed
brew_formula() {
  if brew list --formula "$1" &>/dev/null; then
    echo "✓ $1 already installed, skipping"
  else
    brew install "$1"
  fi
}

# Install Casks -------------------------------------------------------------

# Must Have Casks
brew_cask google-chrome

# Must Have Utilities
brew_cask appcleaner                  # App Cleaner - Apps Uninstaller
brew_cask xquartz                     # XQuartz - X11 server for macOS
brew_cask wezterm                     # Wezterm - Terminal emulator
brew_cask betterdisplay               # BetterDisplay - Internal / External Monitor brightness and volume control
brew_cask alt-tab                     # Alt-Tab - Window switcher
brew_cask jordanbaird-ice             # Open Source Version of Bartender - for menu bar item management

# Code
brew_cask visual-studio-code
brew_cask cursor
brew_cask gcloud-cli
brew_cask ngrok

# Productivity
brew_cask 1password                   # 1Password - Password manager
brew_cask notion                      # Notion - Note-taking app
brew_cask google-drive                # Google Drive - Cloud storage
brew_cask microsoft-office            # Microsoft Office - Office suite
brew_cask microsoft-auto-update       # Microsoft Auto Update - Auto update for Microsoft apps
brew_cask granola                     # Granola - AI Notetaking
brew_cask claude                      # Claude - AI chatbot
brew_cask chatgpt                     # ChatGPT - AI chatbot
brew_cask codex                       # Codex - AI code editor
brew_cask zotero                      # Zotero - Reference manager
brew_cask slack                       # Slack - Chat app
brew_cask wispr-flow                  # Wispr Flow - AI dictation app

# Personal Preferences
brew_cask spotify                     # Spotify - Music streaming
brew_cask whatsapp                    # WhatsApp - Chat app


# Discontinued Casks -------------------------------------------------------------

# -- Not using them anymore ------------------------------------------
# brew_cask lulu                        # Lulu - Network traffic monitor
# brew_cask ghostty                     # Ghostty - Better Terminal
# brew_cask obsidian                    # Obsidian - Note-taking app
# brew_cask r-app
# brew_cask rstudio
# brew_cask onedrive                    # OneDrive - Cloud storage
# brew_cask discord                     # Discord - Chat app
# brew_cask loom                        # Loom - Video recording
# brew_cask nordvpn                     # NordVPN - VPN service

# Utilities
# --- Discontinued in favor of betterdisplay -----------------------
# brew_cask monitorcontrol              # MonitorControl - Internal / External Monitor brightness and volume control

# --- Discontinued because of macos tahoe spotlight improvements ---
# brew_cask raycast                     # Raycast - Spotlight alternative
# brew_cask maccy                       # Maccy - Clipboard manager


# Install Formulae -------------------------------------------------------------
brew_formula git
brew_formula gh
brew_formula wget
brew_formula imagemagick
brew_formula jq
brew_formula openssl
brew_formula tree
brew_formula ncdu
brew_formula xz
brew_formula readline
brew_formula gawk
brew_formula starship
brew_formula tmux
brew_formula fastfetch
brew_formula htop
brew_formula node
brew_formula inetutils
brew_formula duckdb
brew_formula azure-cli
brew_formula direnv
brew_formula uutils-coreutils
brew_formula awscli
brew_formula bcftools
brew_formula pandoc
# brew_formula speedtest
brew_formula kubectl

# brew_formula make # installed by gawk

# Update and Upgrade -------------------------------------------------------------
brew update
brew upgrade


# Set up Homebrew environment -------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"
