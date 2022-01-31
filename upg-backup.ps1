# Back up files to a drive


## Variables
$DriveName = "My Book" # Feel free to change this to suit whatever drive you want
$DrivePath = $(Get-PSDrive | Where-Object {$_.Description -eq $DriveName}).Root
$Hostname = Hostname
$Username = [System.Environment]::UserName
$ArchivePath = "$DrivePath\Backups\$Hostname\$Username\"
$OriginalLocation = Get-Location


## Actions
# Remove previous archive if it exists
If (Test-Path $ArchivePath) {
	Write-Host -ForegroundColor Blue "Archive folder exists."
Else {
	Write-Host -ForegroundColor Blue "Archive folder does not exist."
	Write-Host -ForegroundColor Yellow "Creating folder..."
	New-Item -Force -Type Directory $ArchivePath
}

# Create archive
Write-Host -ForegroundColor Yellow "Creating archive..."
Set-Location $HOME\..
Copy-Item -Recurse .\$Username -Exclude .\$Username\.*
