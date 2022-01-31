#!/usr/bin/pwsh
## Angelo's mp4-to-gif script
## Requires FFmpeg in your PATH
## Output files will have lower resolution for practical reasons

Write-Output "Interactive mp4 --> gif Script"

# Show MP4 files in current folder
Get-ChildItem -Filter *.mp4

Write-Output ""

# Get source file
$src = Read-Host -Prompt "Enter name of mp4"

Write-Output "Creating palette file..."

# Create palette file
ffmpeg -i $src -filter_complex "[0:v] palettegen" C:\\Users\Angelo\pallete.png

Write-Output "Done."

# Get output file name
$out = Read-Host -Prompt "Enter name of output file (use .gif extension)"

Write-Output "Creating GIF..."

# Create output file
ffmpeg -i $src -i C:\\Users\Angelo\pallete.png -r 12 -s 320x180 -filter_complex "[0:v][1:v] paletteuse" $out

Write-Output "Done. Removing palette file..."

# Delete palette file
Remove-Item -Path C:\\Users\Angelo\pallete.png

Write-Output "Done."
