<#
.Synopsis
    Prints the type of the child items.
#>
param (
    [Parameter(Mandatory=$true, HelpMessage="The root path to be enumerated.")]
    [string]$TargetPath
)

Get-ChildItem $TargetPath | Select-Object { $_.GetType() }
