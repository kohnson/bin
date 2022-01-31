#!/usr/bin/pwsh
## Script for downloading music

Param ( [Parameter (Mandatory = $true) ] $dl )

youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg --ignore-errors --output "%(title)s.%(ext)s" $dl
