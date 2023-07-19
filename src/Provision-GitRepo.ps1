param (
    [Parameter(Mandatory=$true)]
    [String]$Path
)

begin {
    New-Item -ItemType Directory -Path $Path
    Set-Location -Path $Path
    git init
    Write-Host "Done provision."
}