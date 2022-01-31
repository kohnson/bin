#!/usr/bin/pwsh
# script for saving stuff quickly with curl

param (
	[Parameter (Mandatory = $true)]
	[string]
	$Link,

	[Parameter (Mandatory = $true)]
	[string]
	$OutFile
)

curl $Link -Lo $OutFile
