# Homebrew completions
fpath=($(brew --prefix)/share/zsh-completions $fpath)

# Bun completions
autoload -Uz compinit
compinit

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
eval "$(starship init zsh)"

# Aliases
alias g=git
alias t=touch-win
