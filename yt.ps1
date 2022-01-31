#!/usr/bin/pwsh

## Video archiving script

# Change these variables to your liking
$arcdir = "$HOME\Videos\arc"			# Archive folder
$arcbat = "$HOME\Programs\var\yt.db"		# Archive batchfile
$config = "$HOME\Programs\etc\conf.ini"		# Archive config
$bcconf = "$HOME\Programs\etc\bitchute.ini"	# BitChute config
$bcbat = "$HOME\Programs\var\bitchute.db"	# BitChute batchfile

# CD
Set-Location $arcdir

# Archive videos
youtube-dl --batch-file $arcbat --config-location $config
youtube-dl --batch-file $bcbat --config-location $bcconf

# CD back
Set-Location -
