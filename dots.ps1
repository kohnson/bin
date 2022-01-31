## Copy dotfiles to repo

Function cpask {
	param (
		[Parameter (Mandatory = $true)] $i, # Items to move
		[Parameter (Mandatory = $true)] $d, # Destination
		[Parameter (Mandatory = $true)] $n  # Name
	)
	
	If ($(Read-Host -Prompt "Copy $n? [Y/n]") -ne "n") {Copy-Item -Path $i -Destination $d}
}
$DotDir = "/Users/Angelo/proj/dotfiles/"
Set-Location $DotDir

# PowerShell stuff
cpask -i $(Get-PoshContext | Select-String ".omp.json") -d "./common/pwsh/" -n "Oh-My-Posh prompt"
cpask -i $PROFILE -d "./common/pwsh/" -n "PowerShell profile"

# ConEmu
cpask -i "$HOME/scoop/persist/conemu/ConEmu/ConEmu.xml" -d "./windows/" -n "ConEmu config"

# Neovim
cpask -i "$env:LOCALAPPDATA/nvim/init.vim" -d "./common/neovim"
