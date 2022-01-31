## Powershell script that updates all programs
## Must be run as administrator

$ogdir = $PWD

# Print update function thing uhhh
Function upd {
	param (
		[Parameter (Mandatory = $true)]
		$txt
		)
	Write-Host -ForegroundColor Yellow "`n$txt"
}

# PowerShell modules
upd "Updating PowerShell Modules..."
Update-Module

# Chocolatey
""
cup all

# Scoop
scoop update *
If ($(Read-Host -Prompt "Clean up old packages? [Y/n] ") -ne "n") {scoop cleanup *}

# PyPI - You will need to update the package list manually, use "pip list"
upd "Updating pip programs..."
pip install --no-warn-script --upgrade pip setuptools wheel msgpack greenlet pynvim

# NodeJS
upd "Updating Node.JS packages..."
npm update -g *

# TeX Live Packages
upd "Updating TeX Live packages..."
tlmgr update -self -all

# R Packages
Rscript -e "update.packages(repos='https://mirror.csclub.uwaterloo.ca/CRAN/')"

#  Git programs
Set-Location $HOME\src\bot\discordbot
upd "SSbot - Pulling..."
git pull
Set-Location ..\mgr
upd "Manager Scripts - Pulling..."
git pull
Set-Location $HOME\src\sneedacity
upd "Sneedacity - Pulling..."
git pull
$choice_rebuild = Read-Host -Prompt "Rebuild? (y/N)"
Switch ($choice_rebuild) {
	"y" {devenv $HOME\Programs\ProgFiles\Sneedacity\Sneedacity.sln /Build}
}

# Vim Plug
nvim -c PlugUpdate

# End
Clear-Host # Clear vim off the screen
Set-Location $ogdir