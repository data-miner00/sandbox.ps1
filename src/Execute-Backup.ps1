$BackupLocationsFilePath = "./data/BackupDirs.txt"

$BackupLocations = Get-Content -Path $BackupLocationsFilePath

$StorageLocation = ""
$BackupName = "Backup $(Get-Date -Format "yyyy-MM-dd hh-mm")"

foreach ($Location in $BackupLocations) {
    Write-Output "Backing up $($Location)"

    $LeadingPath = "$($Location.Replace(':', ''))"
    $BackupFullPath = "$StorageLocation\$BackupName\$LeadingPath"

    if (-not (Test-Path $BackupFullPath)) {
        New-Item -Path $BackupFullPath -ItemType Directory
    }

    Get-ChildItem -Path $Location `
    | Copy-Item -Destination $BackupFullPath -Container -Recurse
}

Compress-Archive -Path "$StorageLocation\$BackupName" -DestinationPath "$StorageLocation\$BackupName.zip" -CompressionLevel Fastest
