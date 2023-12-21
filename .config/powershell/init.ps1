# Configuration for starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\config.toml"

# Import icons
Import-Module -Name Terminal-Icons

$ENV:XDG_CONFIG_HOME = "$HOME\.config"

Set-Alias -Name vm -Value nvim
Set-Alias -Name t -Value touch-win

# neofetch
