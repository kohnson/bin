#!/usr/bin/pwsh
## Multi-purpose document compilation script
## Requires pandoc and R

param (
	[Parameter(Mandatory=$true)] # input file
	[string]
	$InFile
)

# Get file extension
$ext = $(Get-item $InFile).Extension
# Replace backslashes with forward for R
$InFileFS = $InFile -replace "\\","/"
# Remove file extension
$InFileEX = $InFile -replace $ext,""

# Compile
Switch ($ext) {
	".rmd" { Rscript -e "rmarkdown::render('$InFileFS')" }
	".md" { pandoc $InFile -w pdf -o "$InFileEX.pdf" }
	".tex" { pdflatex $InFile }
	".dvi" { dvipdfm $InFile }
}
