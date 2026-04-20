# Dotfiles
Minimal and reproducible macOS setup focused on Neovim, Zsh and Expo development

This repository contains my personal configuration for:
- ZSH
- Neovim (editor)
- Ghostty (terminal)
- Starship prompt
- Development tools
    - Node
    - Expo
    - Python
    - Lua

# Installation
Clone this repository into your home directory
````bash
$ git clone https://github.com/zitrocode/dotfiles.git
````

Then run:
````bash
$ chmod +x install.sh
$ ./install.sh
````

This will install:
- Homebrew
- ZSH Tools
- Neovim and LSPs
- Expo and development tools
- Required CLI utilities

## Structure
````bash
~
├── .config/
│   ├── nvim/
│   ├── ghostty/
│   └── starship.toml
├── .zshrc
├── .zprofile
├── .czrc
└── install.sh
````

# Usage
After installation, restart your terminal:
````bash
$ exec zsh
````

Then verify:
````bash
$ brew --version
$ nvim --version
$ node --version
$ starship --version
````

# Philosophy
These dotfiles follow a minimal setup
- Simple
- Fast
- Maintainable
- Easy to reinstall
- Focused on developer productivity
