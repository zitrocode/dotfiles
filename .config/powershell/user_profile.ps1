# Configuration for starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\powershell\starship\config.toml"

# Import-Module -Name Terminal-Icons

# Enable PSReadLine
if ($host.Name -eq 'ConsoleHost') {
  Import-Module PSReadLine
  Set-PSReadLineOption -EditMode Emacs
  Set-PSReadLineKeyHandler -Key Tab -Function Complete
  Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
  Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

$ENV:XDG_CONFIG_HOME = "$HOME\.config"

# Remove Aliases
Import-Module "$HOME\.config\powershell\alias\clear_alias.ps1"

# Import Aliases for git
Import-Module "$HOME\.config\powershell\alias\git.ps1"

# Alias
Set-Alias -Name vm -Value nvim # For Neovim

# Touch-Win: https://github.com/zitrocode/touch-win
Set-Alias -Name t -Value touch-win

# Icon-Tree: https://github.com/zitrocode/icon-tree
Function ItreeFolderContents { itree --folder-contents }
Set-Alias -Name ll -Value itree
Set-Alias -Name lf -Value ItreeFolderContents
