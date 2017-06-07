function Initialize-Map
{
    [CmdletBinding()]
    param (
        [parameter( Mandatory = $true )]
        [string] $MapName
    )

    New-Directory "Content"
    New-Directory "Content\maps"
    New-Directory "Content\materials\$($MapName)"
    New-Directory "Content\models"
    New-Directory "Content\sounds"
}

function New-Directory( $path ) {
    mkdir $path -Force > $null
}
