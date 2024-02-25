param (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $FilePath
)

[System.Collections.ArrayList]$out = @()

Get-ChildItem -Recurse |
ForEach-Object {
    $relPath = (Resolve-Path -Path $_.fullname -Relative) -replace "\.\\", ""
    Write-Verbose "Processing $relPath"
    if ($_.Gettype().name -eq 'FileInfo') {
        $f = [pscustomobject]@{
            ItemType = "file"
            Path     = $relPath
            Content  = (Get-Content -Path $_.fullname)
        }
        $out.add($f)
    }
    else {
        $d = [pscustomobject]@{
            ItemType = "directory"
            Path     = $relPath
        }
        $out.Add($d)
    }
}

$out | ConvertTo-Json | Out-File -FilePath $FilePath