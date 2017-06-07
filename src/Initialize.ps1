function Initialize-MapProject
{
    [CmdletBinding()]
    param (
        [parameter( Mandatory = $true )]
        [string] $MapName
    )

    Write-DirectoryStructure
    Write-LevelSounds
    Write-MapSkeleton
    Write-ProjectFile
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

function Write-MapSkeleton {
    $mapTemplate = "https://raw.githubusercontent.com/alexwnovak/PoshHammer/master/data/map_template.vmf"
    Invoke-WebRequest $mapTemplate -OutFile "$($MapName).vmf"    
}

function Write-ProjectFile {
    $projectFile = "project.json"
    $projectObject = New-Object PSObject -Property @{
        MapName = $MapName
    }

    $projectObject | ConvertTo-Json | Out-File $projectFile
}

function New-Directory( $path ) {
    mkdir $path -Force > $null
}
