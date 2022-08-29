# Configuration for starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\powershell\starship.toml"

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

# Alias
Set-Alias vm nvim
Set-Alias g git

Function GitCommit { gitmoji --commit }
Set-Alias gct GitCommit
Set-Alias t touch-win
Set-Alias ll itree

Function ItreeFolderContents { itree --folder-contents }
Set-Alias lf ItreeFolderContents
