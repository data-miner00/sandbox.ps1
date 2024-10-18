<#
.Synopsis
    Copies file items within a directory to a destination folder. Folders are excluded
#>

param (
    [Parameter(Mandatory=$true, HelpMessage="The path that contain files to be copied.")]
    [string]$TargetPath,

    [Parameter(Mandatory=$true, HelpMessage="The destination path.")]
    [string]$DestinationPath
)

Get-ChildItem $TargetPath |
Where-Object { $_ -isnot [System.IO.DirectoryInfo] } |
Copy-Item -Destination { Join-Path $DestinationPath ([string]::Empty) }

