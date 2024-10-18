function Write-Hello {
    Param(
        [Parameter(Mandatory=$true, HelpMessage="What is your name?")]
        [string]$Name,

        [Parameter(Mandatory=$true, HelpMessage="How old are you?")]
        [int]$Age
    )

    Write-Host "Hello $Name, you are $Age years old!"
}

function Write-Yo {
    Param(
        [Parameter(Mandatory=$true, HelpMessage="What is your name?")]
        [string]$Name,

        [Parameter(Mandatory=$true, HelpMessage="How old are you?")]
        [int]$Age
    )

    Write-Host "Yo $Name, you are $Age years old!"
}

# Set default parameter for `Name` when call `Write-Hello`

$PSDefaultParameterValues.Add('Write-Hello:Name', 'asdf')

Write-Hello -Age 99 # Hello asdf, you are 99 years old!

# Clear all default parameters

$PSDefaultParameterValues.Clear()

# Set default parameters for all commands that starts with `Write-`

$PSDefaultParameterValues.Add('Write-*:Name', 'abcd')
$PSDefaultParameterValues.Add('Write-*:Age', 99)

Write-Hello # Hello abcd, you are 99 years old!
Write-Yo # Yo abcd, you are 99 years old!
