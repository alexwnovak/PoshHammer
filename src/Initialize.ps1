function Initialize-Map
{
    [CmdletBinding()]
    param (
        [parameter( Mandatory = $true )]
        [string] $MapName
    )

    Write-DirectoryStructure
    Write-LevelSounds
}

function Write-DirectoryStructure {
    New-Directory "Content"
    New-Directory "Content\maps"
    New-Directory "Content\materials\$($MapName)"
    New-Directory "Content\models"
    New-Directory "Content\sounds"
}

function Write-LevelSounds {
    $levelSounds = "https://raw.githubusercontent.com/alexwnovak/PoshHammer/master/data/level_sounds.txt"
    Invoke-WebRequest $levelSounds -OutFile "Content\maps\$($MapName)_level_sounds.txt"
}

function New-Directory( $path ) {
    mkdir $path -Force > $null
}
