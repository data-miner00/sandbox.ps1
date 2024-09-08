# Reference: https://blog.ironmansoftware.com/powershell-cmdlet-binding/
[CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess)]
param (
    [Parameter(Mandatory=$false)]
    [String]$FileName = "File.txt"
)

begin {
    Write-Host "This is a starting process."
}

process {
    if ($PSCmdlet.ShouldProcess("Remove File"))
    {
        Write-Host "Provisioning \"$FileName\".."
        Write-Output "I am a new file" >> "$FileName"

        Write-Host "About to remove \"$FileName\""
        Remove-Item $FileName

        Write-Host "Done removing \"$FileName\""
    }
}

end {
    Write-Host "This is an ending process."
}