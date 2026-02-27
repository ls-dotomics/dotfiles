# dotfiles

Automated macOS development environment setup. One command installs Homebrew, CLI tools, GUI apps, and configures a modern Bash shell with Starship prompt, ble.sh line editing, and direnv.

## Quick start

```bash
git clone https://github.com/<you>/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
bash install.sh
```

`install.sh` runs seven steps in order:

| Step | Script | What it does |
|------|--------|--------------|
| 1 | `01_install_homebrew.sh` | Installs Homebrew, Homebrew's Bash, and sets it as the default shell |
| 2 | `02_install_brew_formulae_and_casks.sh` | Installs CLI formulae and GUI casks (see lists below) |
| 3 | `03_install_utils.sh` | Builds [ble.sh](https://github.com/akinomyoga/ble.sh) from source and installs [uv](https://github.com/astral-sh/uv) |
| 4 | `04_dotfiles_setup.sh` | Symlinks config files into `$HOME` |
| 5 | `05_git_setup.sh` | Prompts for Git identity and runs `gh auth login` |
| 6 | `06_uv_setup.sh` | Installs Python 3.12 via uv |
| 7 | `07_starship_setup.sh` | Symlinks `starship.toml` into `~/.config/` |

## Repository layout

```
dotfiles/
├── install.sh              # Master installer — runs all steps
├── bash_profile            # PATH, locale, sources bashrc
├── bashrc                  # Interactive shell config (Starship, ble.sh, direnv)
├── bash_aliases            # Shortcuts (ll, gs, .., etc.)
├── bash_functions          # Azure VM helper functions
├── blerc                   # ble.sh syntax highlighting and prompt config
├── starship.toml           # Starship prompt theme
└── macos-install/
    ├── 01_install_homebrew.sh
    ├── 02_install_brew_formulae_and_casks.sh
    ├── 03_install_utils.sh
    ├── 04_dotfiles_setup.sh
    ├── 05_git_setup.sh
    ├── 06_uv_setup.sh
    └── 07_starship_setup.sh
```

## Symlinks

`04_dotfiles_setup.sh` creates these links:

| Source | Target |
|--------|--------|
| `bash_profile` | `~/.bash_profile` |
| `bashrc` | `~/.bashrc` |
| `bash_aliases` | `~/.bash_aliases` |
| `bash_functions` | `~/.bash_functions` |
| `blerc` | `~/.blerc` |
| `starship.toml` | `~/.config/starship.toml` |

## Shell startup chain

```
~/.bash_profile
  └─ sources ~/.bashrc
       ├─ Ghostty shell integration
       ├─ ble.sh (--noattach)
       ├─ Starship prompt init
       ├─ direnv hook
       ├─ ble-attach
       ├─ ~/.bash_aliases
       └─ ~/.bash_functions
```

## What gets installed

### Homebrew formulae

git, gh, wget, imagemagick, jq, openssl, tree, ncdu, xz, readline, gawk, starship, tmux, fastfetch, htop, npm, inetutils, duckdb, azure-cli, direnv, uutils-coreutils

### Homebrew casks

**Utilities** — AppCleaner, Lulu, XQuartz, Ghostty, BetterDisplay, Alt-Tab, Ice

**Development** — VS Code, Cursor, Google Cloud CLI

**Productivity** — 1Password, Notion, Google Drive, Microsoft Office, Discord, Granola, Claude, ChatGPT, NordVPN, Zotero

**Personal** — Spotify, WhatsApp

### Built from source

- **[ble.sh](https://github.com/akinomyoga/ble.sh)** — Bash line editor with syntax highlighting (installed to `~/.local/share/blesh/`)
- **[uv](https://github.com/astral-sh/uv)** — Fast Python package and project manager

## Requirements

- macOS (Apple Silicon or Intel)
- Internet connection
- Admin access (for `chsh` and writing to `/etc/shells`)
