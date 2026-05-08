# Requires Powershell 7
class Names : System.Management.Automation.IValidateSetValueGenerator
{
    [string[]] GetScopedGuesses()
    {
        # This can be a logic to get something from database or API
        $Names = @('Shaun', 'Sam', 'Brian', 'Keith')
        return $Names;
    }
}

function Test-WhatIsMyName {

    [CmdLetBinding()]
    Param (
        [Parameter(Mandatory=$True)]
        [ValidateSet([Names])]
        [string] $Guess
    )

    if ($Guess -eq "Shaun") {
        Write-Host "You are right!"
    } else {
        Write-Error "You are wrong!"
    }
}
