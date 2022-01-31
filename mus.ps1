#!/usr/bin/pwsh
# Script for watching videos on the command line
# Requires MPV and youtube-dl

Param ( [switch] $Shuffle )
If ($Shuffle) {$setShuf = "--shuffle"}
Write-Host -ForegroundColor Blue "Input link to play, or q to quit"
$link = Read-Host -Prompt "Paste in link"

While ($link -ne "q") {
	mpv --no-video $setShuf $link
	$link = Read-Host -Prompt "Paste in link"
}
