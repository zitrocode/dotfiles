# Functions
Function GitAdd([string]$data) { git add $data }
Function GitClone([string]$user, [string]$repo) {
  git clone https://github.com/$user/$repo.git
}
Function GitCommit { gitmoji --commit } # Git Commit
Function GitStatus { git status }

Function GitPushOriginOther([string]$origin) {
  git push -u origin $origin
}

Function GitPushOriginMaster {
  git push -u origin master
}

Function GitPullOriginOther ([string]$origin) {
  git pull origin $origin
}

Function GitPullOriginMaster {
  git pull origin master
}

# Alias
Set-Alias -Name g -Value git
Set-Alias -Name ga -Value GitAdd
Set-Alias -Name gc -Value GitClone
Set-Alias -Name gci -Value GitCommit
Set-Alias -Name gst -Value GitStatus
Set-Alias -Name gpso -Value GitPushOriginOther
Set-Alias -Name gpsom -Value GitPushOriginMater
Set-Alias -Name gplo -Value GitPullOriginOther
Set-Alias -Name gplom -Value GitPullOriginMaster
