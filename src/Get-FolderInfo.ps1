param(
    [Parameter(Mandatory=$true)]
    [String]$Path
)

begin {
    Write-Host $Path
    Get-ChildItem -Recurse -Path $Path |
    Select-Object -Property FullName, Name, IsReadOnly, Extension, LastAccessTimeUtc |
    ForEach-Object {
        Write-Host -------------------------------
        Write-Host Name             : $_.Name
        Write-Host Extension        : $_.Extension
        Write-Host Last accessed    : $_.LastAccessTimeUtc
        Write-Host Full path        : $_.FullName
        Write-Host Readonly         : $_.IsReadOnly
        Write-Host -------------------------------
    }
}