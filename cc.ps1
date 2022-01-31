#!/usr/bin/pwsh
# Calculator

Write-Host -ForegroundColor Blue "Calculator`n`"q`" to exit."

While ($in -ne "q") {
	$in = Read-Host -Prompt "exp"
	If ($in -ne "q") {
		$out = Invoke-Expression $in
		Write-Host $out
		Set-Clipboard $out
		Write-Host ""
	}
}
