Function TestFunc {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet("A", "B", "C")]
        [String]$Param1
    )
    
    Write-Host "Your parameter is '$Param1'!"
}

TestFunc A
TestFunc D # Throws ParameterBindingValidatingException
