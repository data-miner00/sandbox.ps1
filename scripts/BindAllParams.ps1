<#
.Synopsis
    Demonstrates binding *all* parameter in PowerShell.
#>
param (
    [Parameter(Mandatory=$true)]
    [string]$Name,

    [Parameter(Mandatory=$true)]
    [int]$Age,

    [Parameter(Mandatory=$false)]
    [switch]$IsRich
)

function InnerFunc {
    [Parameter(Mandatory=$true)]
    [string]$Name,

    [Parameter(Mandatory=$true)]
    [int]$Age,

    [Parameter(Mandatory=$false)]
    [switch]$IsRich

    $RichRepresentation = if ($IsRich) { "are rich" } else { "are not rich" }

    Write-Host "Hi $Name, you are $Age years old and $RichRepresentation"
}

InnerFunc @PSBoundParameters 1>$null