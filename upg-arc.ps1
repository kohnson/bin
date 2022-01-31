#!/usr/bin/pwsh
## Angelo's video-archiving script
## Requires youtube-dl and ffmpeg in your $PATH

## Variable stuff
$archivedir = "$HOME\vids\Archives"			# Archive folder
$memedir = "$HOME\pix\Saved Pictures\Memetics"		# Meme folder
$config = "$HOME\Programs\etc\conf.ini"			# Archive config
$bcconf = "$HOME\Programs\etc\bitchute.ini"       	# Bitchute config (without G-password)
$memeconf = "$HOME\Programs\etc\meme.ini"		# Meme folder config
$ogdir = Get-Location					# Current folder


## YouTube Archive
# Go to archive folder
Set-Location $archivedir
# Barricade Garage
youtube-dl https://www.youtube.com/channel/UCPbDe-Hr8fdo6SXtlbAjygA/videos --config-location $config # BG Comedy
youtube-dl https://www.youtube.com/channel/UCTD7FIfKEND5zuTNLwl2P9A/videos --config-location $config # Main Youtube
youtube-dl https://www.bitchute.com/channel/SzyCfKdruqGx/ --config-location $bcconf # BitChute
# IJustWannaGrill
youtube-dl https://www.youtube.com/channel/UCTw27kzNZXhg0ieyzh-fexQ/videos --config-location $config
youtube-dl https://www.youtube.com/channel/UCjdW_HxW1esddoI0F2yswBw/videos --config-location $config
youtube-dl https://www.youtube.com/channel/UCKuWXwKd3VsY1Xt5quLz54Q/videos --config-location $config
youtube-dl https://www.youtube.com/channel/UCc3neiUWRwr8QzRrLnOOf4g/videos --config-location $config
# Polcompistan: True Stories
youtube-dl https://www.youtube.com/channel/UCoX92pCeoPE4_jQG8Sws24w/videos --config-location $config
# Anti-Root Collective
youtube-dl https://www.youtube.com/channel/UC-_6ElIhgDu6tpg40ZKFncA/videos --config-location $config
# Strigoi
youtube-dl https://www.youtube.com/channel/UCS2hRKPZHLBhQd_iJdfNwgQ/videos --config-location $config
# Skwyd
youtube-dl https://www.youtube.com/channel/UCniTwT8FGp25cWFTByEZVXQ/videos --config-location $config
# Phoon
youtube-dl https://www.youtube.com/channel/UCdaZc5qLqHlIhTlvlEjXLsA/videos --config-location $config
# MilkMessiah
youtube-dl https://www.youtube.com/channel/UCB8j9BWTImfz8btePQ8vsVw/videos --config-location $config
# Derek
youtube-dl https://www.youtube.com/channel/UCCPlR3ZQ6kS5HvhhF828i4w/videos --config-location $config

## Meme folder stuff
# Go to folder
Set-Location $memedir
# 10 Outta 10
youtube-dl https://www.youtube.com/channel/UCqcZ7t3bo8i5BgnZiKxbdSA/videos --config-location $memeconf
# Super
youtube-dl https://www.youtube.com/channel/UCKPVnRaCewrhQ0CT5h1g1Zw/videos --config-location $memeconf
# Magmashice
youtube-dl https://www.bitchute.com/channel/magmashice/ --config-location $bcconf
youtube-dl https://www.youtube.com/c/Magmashice/videos --config-location $memeconf


## Final steps
# Add blank space
Write-Output "`n`n"
# Get folder size
Write-Output "Main archive size (gigabytes):",$([Math]::Round(((Get-ChildItem $archivedir -Recurse | Measure-Object -Property Length -Sum).Sum / 1GB),2))
# More blank space
Write-Output "`n`n"
# Return to original folder
Set-Location $ogdir
