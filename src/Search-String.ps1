param(
  [Parameter(Mandatory = $True)]
  [string] $SearchTerm
)

Select-String *, */* -pattern $SearchTerm -CaseSensitive

