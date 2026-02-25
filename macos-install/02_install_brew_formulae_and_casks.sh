#!/bin/bash
set -euo pipefail

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
else
    echo "Homebrew successfully installed."
fi

# Install Casks -------------------------------------------------------------

# Must Have Casks
brew install --cask google-chrome

# Must Have Utilities
brew install --cask appcleaner                  # App Cleaner - Apps Uninstaller
brew install --cask lulu                        # Lulu - Network traffic monitor
brew install --cask xquartz                     # XQuartz - X11 server for macOS
brew install --cask ghostty                     # Ghostty - Better Terminal
brew install --cask betterdisplay               # BetterDisplay - Internal / External Monitor brightness and volume control
brew install --cask alt-tab                     # Alt-Tab - Window switcher
brew install --cask jordanbaird-ice             # Open Source Version of Bartender - for menu bar item management

# Code 
brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask gcloud-cli
brew install --cask google-cloud-sdk
# brew install --cask r-app
# brew install --cask rstudio 

# Productivity
brew install --cask 1password                   # 1Password - Password manager
brew install --cask notion                      # Notion - Note-taking app
brew install --cask google-drive                # Google Drive - Cloud storage
brew install --cask microsoft-office            # Microsoft Office - Office suite
brew install --cask microsoft-auto-update       # Microsoft Auto Update - Auto update for Microsoft apps
# brew install --cask onedrive                    # OneDrive - Cloud storage
brew install --cask discord                     # Discord - Chat app
brew install --cask granola                     # Granola - AI Notetaking
brew install --cask claude                      # Claude - AI chatbot
brew install --cask chatgpt                     # ChatGPT - AI chatbot
# brew install --cask loom                        # Loom - Video recording
brew install --cask nordvpn                     # NordVPN - VPN service
brew install --cask zotero                      # Zotero - Reference manager

# Personal Preferences
brew install --cask spotify                     # Spotify - Music streaming
brew install --cask whatsapp                    # WhatsApp - Chat app


# Discontinued Casks -------------------------------------------------------------

# Productivity 
# -- Not using it anymore ------------------------------------------
# brew install --cask obsidian                    # Obsidian - Note-taking app

# Utilities
# --- Discontinued in favor of betterdisplay -----------------------
# brew install --cask monitorcontrol              # MonitorControl - Internal / External Monitor brightness and volume control

# --- Discontinued because of macos tahoe spotlight improvements ---
# brew install --cask raycast                     # Raycast - Spotlight alternative                                             
# brew install --cask maccy                       # Maccy - Clipboard manager 

# Install Formulae -------------------------------------------------------------
brew install git
brew install gh
brew install wget
brew install imagemagick
brew install jq
brew install openssl
brew install tree
brew install ncdu
brew install xz
brew install readline
brew install gawk
brew install starship
brew install tmux
brew install neofetch
brew install htop
brew install npm
brew install inetutils
brew install duckdb 
brew install azure-cli

# brew install make # installed by gawk

# Update and Upgrade -------------------------------------------------------------
brew update
brew upgrade


# Set up Homebrew environment -------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"


# Check if Homebrew Bash is in /etc/shells and set it as the default shell
if [[ -f "/opt/homebrew/bin/bash" ]] && ! grep -q "^/opt/homebrew/bin/bash$" /etc/shells; then
    echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells > /dev/null
    echo "✓ Added /opt/homebrew/bin/bash to /etc/shells"
fi

chsh -s /opt/homebrew/bin/bash

brew update
brew upgrade
