# https://stackoverflow.com/questions/755382/i-want-to-delete-all-bin-and-obj-folders-to-force-all-projects-to-rebuild-everyt
Param (
    [Parameter(Mandatory=$true)]
    [String[]]$Directories
)

Get-ChildItem .\ -Include $Directories -Recurse | ForEach-Object ($_) {
    Write-Host "Removing $($_.fullname)"
    Remove-Item $_.fullname -Force -Recurse
}

Write-Host "Removed contents from '$([string]::Join(', ', $Directories))' subdirectories."