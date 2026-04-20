#!/usr/bin/env zsh

START_TIME=$(date +%s)

set -e

# Colors
RESET="\033[0m"
BOLD="\033[1m"

BLUE="\033[34m"
GREEN="\033[32m"
YELLOW="\033[33m"

# Logging helpers
section() {
  echo ""
  echo "${BOLD}${BLUE}==> $1${RESET}"
}

info() {
  echo "  ${YELLOW}•${RESET} $1"
}

success() {
  echo "  ${GREEN}✓${RESET} $1"
}

# Package installers
install_if_missing() {
  if ! command -v "$1" &>/dev/null; then
    info "Installing $1"
    brew install "$1"
    success "$1 installed"
  else
    success "$1 already installed"
  fi
}

install_cask_if_missing() {
  if ! brew list --cask "$1" &>/dev/null; then
    info "Installing $1"
    brew install --cask "$1"
    success "$1 installed"
  else
    success "$1 already installed"
  fi
}

install_npm_global_if_missing() {
  if ! npm list -g --depth=0 "$1" &>/dev/null; then
    info "Installing npm package $1"
    npm install -g "$1"
    success "$1 installed"
  else
    success "$1 already installed"
  fi
}

# Homebrew
section "Checking Homebrew"

if ! command -v brew &>/dev/null; then
  info "Installing Homebrew"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"

  success "Homebrew installed"
else
  success "Homebrew already installed"
fi

info "Updating Homebrew"
brew update

# Core (Node first for npm tools)
section "Installing core tools"
install_if_missing node

# ZSH & Terminal
section "Installing ZSH tools"

install_if_missing starship
install_if_missing zsh-autosuggestions
install_if_missing zsh-completions
install_if_missing zsh-history-substring-search
install_if_missing zsh-syntax-highlighting
install_if_missing fastfetch

install_cask_if_missing ghostty

# Neovim + LSP
section "Installing Neovim tools"

install_if_missing neovim
install_if_missing lua-language-server
install_if_missing stylua
install_if_missing tree-sitter
install_if_missing tree-sitter-cli
install_if_missing fd
install_if_missing ripgrep
install_if_missing tree

section "Installing Neovim language servers"

install_npm_global_if_missing typescript
install_npm_global_if_missing typescript-language-server
install_npm_global_if_missing vscode-json-languageserver
install_npm_global_if_missing vscode-langservers-extracted
install_npm_global_if_missing neovim

# Development Stack
section "Installing development stack"

install_if_missing python@3.14
install_if_missing pipx
install_if_missing ruby
install_if_missing cocoapods
install_if_missing watchman

install_cask_if_missing zulu@17

info "Configuring pipx"
pipx ensurepath

# Expo & CLI tools
section "Installing Expo tools"

install_npm_global_if_missing expo
install_npm_global_if_missing eas-cli
install_npm_global_if_missing commitizen
install_npm_global_if_missing cz-conventional-changelog
install_npm_global_if_missing touch-win

# Done
echo ""
echo "${GREEN}${BOLD}Setup complete.${RESET}"
echo ""

echo "${BOLD}Next steps:${RESET}"
echo "  • Restart your terminal or run:"
echo "      exec zsh"
echo ""

echo "  • Verify installations:"
echo "      nvim --version"
echo "      node --version"
echo "      starship --version"
echo ""

echo "  • (Optional) Remove installer:"
echo "      rm ./install.sh"
echo ""

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "Completed in ${DURATION}s"
