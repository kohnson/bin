#!/usr/bin/pwsh

## Unit conversion script

Param (
	[Parameter(Position = 0)]
	[string]$Type,
	[Parameter(Position = 1)]
	[string]$Amount,
	[Parameter(Position = 2)]
	[string]$From,
	[Parameter(Position = 3)]
	[string]$To,
	[Parameter(Position = 4)]
	[switch]$Full,
	[Parameter(Position = 5)]
	[switch]$NoUnit
)

# and now, a bunch of incomprehensible nested switch statements
Switch ($Type) {
	"t" {	# Temperature
		Switch ($From) {
			"c" {	# From Celsius
				Switch ($To) {
					"c" { $OutAmount = $Amount; $OutUnit = "°C" }
					"f" { $OutAmount = $Amount * 1.8 + 32; $OutUnit = "°F" }
					"k" { $OutAmount = $Amount + 273.15; $OutUnit = "K" }
				}
			}
			"f" {	# From Fahrenheit
				Switch ($to) {
					"c" { $OutAmount = ( $Amount - 32 ) * 5 / 9; $OutUnit = "°C" }
					"f" { $OutAmount = $Amount; $OutUnit = "°F" }
					"k" { $OutAmount = ( $Amount + 459.67 ) * 5 / 9; $OutUnit = "K" }
				}
			}
			"k" {	# From Kelvin
				Switch ($to) {
					"c" { $OutAmount = $Amount - 273.15; $OutUnit = "°C" }
					"f" { $OutAmount = $Amount * 9 / 5 - 459.67; $OutUnit = "°F" }
					"k" { $OutAmount = $Amount; $OutUnit = "K" }
				}
			}
		}
	}
}

# output, just for now
$OutAmount
$OutUnit

