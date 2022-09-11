$DirectoryListFilePath = "./data/LogDirs.csv"

$DirectoryList = Import-Csv -Path $DirectoryListFilePath

foreach($Directory in $DirectoryList) {
    Get-ChildItem -Path $Directory.Path -Filter "$($Directory.FileName)" `
    | Where-Object LastWriteTime -LT $(Get-Date).AddDays(-$Directory.KeepForDays) `
    | Remove-Item -Confirm:$false -Force -WhatIf
}
