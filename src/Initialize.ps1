function Initialize-Map
{
    [CmdletBinding()]
    param (
        [parameter( Mandatory = $true )]
        [string] $MapName
    )


    Write-Host "Map name: $($MapName)"
}
