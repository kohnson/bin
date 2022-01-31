#!/usr/bin/pwsh
# Script for watching videos on the command line
# Requires MPV and youtube-dl

Write-Host -ForegroundColor Blue "Input link to play, or q to quit"
$link = Read-Host -Prompt "Paste in link"

While ($link -ne "q") {
	mpv $link
	$link = Read-Host -Prompt "Paste in link"
}
