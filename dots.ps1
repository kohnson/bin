## Copy dotfiles to repo

Function cpask {
	param (
		[Parameter (Mandatory = $true)] $i, # Items to move
		[Parameter (Mandatory = $true)] $d, # Destination
		[Parameter (Mandatory = $true)] $n  # Name
	)
	
	If ($(Read-Host -Prompt "Copy $n`? [Y/n]") -ne "n") {
		Copy-Item -Path $i -Destination $d 
		$OpDone = $true
	}
}
$DotDir = "~/dotfiles/"
Set-Location $DotDir
git status;""

# PowerShell stuff
cpask $(Get-PoshContext | Select-String ".omp.json") "./common/pwsh/" "Oh-My-Posh prompt"
cpask $PROFILE "./common/pwsh/" "PowerShell profile"

# ConEmu
cpask "$HOME/scoop/persist/conemu/ConEmu/ConEmu.xml" "./windows/" "ConEmu.xml"

# Neovim
cpask "$env:LOCALAPPDATA/nvim/init.vim" "./common/neovim" "init.vim"

# Qutebrowser
cpask "$env:APPDATA/qutebrowser/config/autoconfig.yml" "./common/qutebrowser/autoconfig.yml" "Qutebrowser autoconfig"

# Git
cpask "~/.gitconfig" "./common/" ".gitconfig"

# Winfetch config
cpask "~/.config/winfetch/config.ps1" "./windows/winfetch/config.ps1" "Winfetch config"


git status
If ($(Read-Host -Prompt "Stay in dotfiles? [Y/n]") -eq "n") {Set-Location -}
