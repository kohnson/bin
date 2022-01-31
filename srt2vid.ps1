#!/usr/bin/pwsh
## Angelo's FFmpeg Subtitling Script
## Requires FFmpeg in your $PATH

# Setup and info
Write-Host -ForegroundColor Green "Add Subtitles to Video"
Write-Host "`n"
Get-ChildItem -Filter -Name *.mp4
Get-ChildItem -Filter -Name *.mov
Get-ChildItem -Filter -Name *.mkv
Write-Host "`n"
$InVid = Read-Host -Prompt "Input video name"
$InSub = Read-Host -Prompt "Input sub track name"
$OutVid = Read-Host -Prompt "Output video name"
$OutSub = Read-Host -Prompt "Output sub track language"

# Do the thing
ffmpeg -i $InVid -i $InSub -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=$OutSub $OutVid
