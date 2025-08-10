function Versioned-Replacement {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$FilePattern,

        [Parameter(Mandatory = $true)]
        [string]$SearchPattern,

        [Parameter(Mandatory = $true)]
        [string]$Replacement
    )

    if (-Not (Test-Path -Path $Path)) {
        Write-Error "The specified path does not exist: $Path"
        return
    }

    Get-ChildItem -Path $Path -Recurse -File -Filter $FilePattern | ForEach-Object {
        Copy-Item -Path $_.FullName -Destination "$($_.FullName).bak" -Force
        Write-Host "Backup created for file: $($_.FullName)"

        (Get-Content $_.FullName) -replace $SearchPattern, $Replacement | Set-Content $_.FullName
        Write-Host "Replaced in file: $($_.FullName)"
    }
}

Versioned-Replacement -Path "test" -SearchPattern "{{name}}" -Replacement "John Doe" -FilePattern "*.txt"
Write-Host "Replacement completed."