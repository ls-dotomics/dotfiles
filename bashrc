# Only run in interactive shells
[[ $- != *i* ]] && return 0

# Ghostty shell integration — must go at the very top
if [ -n "${GHOSTTY_RESOURCES_DIR-}" ]; then
  builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

# Reduce history size for performance
export HISTSIZE=500
export HISTFILESIZE=1000

# # Source blerc early to set up ble.sh
# if [ -f ~/.blerc ]; then
#   source ~/.blerc
# fi

# Add uv (uutils/coreutils) if installed via Homebrew
if command -v uutils-coreutils >/dev/null 2>&1; then
  export PATH="$(brew --prefix uutils-coreutils)/libexec/gnubin:$PATH"
fi

# Load ble.sh without attaching immediately
if [ -f "${HOME}/.local/share/blesh/ble.sh" ]; then
  source "${HOME}/.local/share/blesh/ble.sh" --noattach
fi

# Initialize Starship prompt
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

# direnv — auto-activate project venvs on cd
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

# Attach ble.sh to enable its editing features
[[ ${BLE_VERSION-} ]] && ble-attach

# Source aliases
if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

# Source custom functions
if [ -f "$HOME/.bash_functions" ]; then
  source "$HOME/.bash_functions"  
fi

