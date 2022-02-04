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

# PowerShell help
upd "Updating PowerShell Help..."
Update-Help -UICulture en-US

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
""
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

# Vim Plug
nvim -c PlugUpdate

# End
Clear-Host # Clear vim off the screen
Set-Location $ogdir
