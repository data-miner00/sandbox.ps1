$VersionTable = $PSVersionTable.PSVersion

$VersionOutput = "$($VersionTable.Major).$($VersionTable.Minor).$($VersionTable.Build) R$($VersionTable.Revision)"

Write-Host Finished checking Powershell version: $VersionOutput
