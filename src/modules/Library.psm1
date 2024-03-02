
function Test-PathExists {
    param (
        [Parameter(Mandatory=$true)]
        [String]$FilePath
    )

    return Test-Path $FilePath -IsValid
}

function Test-FileExists {
    param (
        [Parameter(Mandatory=$true)]
        [String]$FilePath
    )

    return Test-Path $FilePath -IsValid -PathType Leaf
}

function Test-FileExistsBesides {
    param (
        [Parameter(Mandatory=$true)]
        [String]$FilePath,

        [Parameter(Mandatory=$true)]
        [String]$ExcludeFileExtension
    )

    return Test-Path $FilePath -Exclude *.$ExcludeFileExtension
}

function Test-FileNewerThan {
    param (
        [Parameter(Mandatory=$true)]
        [String]$FilePath,

        [Parameter(Mandatory=$true)]
        [DateTime]$Date
    )

    return Test-Path $FilePath -NewerThan $Date
}

function Get-PowershellDirectory {
    return $PSHOME
}

function Get-ComputerName {
    return $env:COMPUTERNAME
}
