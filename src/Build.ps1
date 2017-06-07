$game = "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf"

function Build-Map
{
    [CmdletBinding()]
    param (
        [string] $Profile = "Default"
    )

    $project = Read-Project
    Run-Vbsp $project
    Run-Vvis $project
    Run-Vrad $project
    Copy-Map $project
}

function Read-Project {
    return Get-Content -Raw -Path project.json | ConvertFrom-Json
}

function Run-Vbsp( $project ) {
    $vbsp = "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\bin\vbsp.exe"
    & $vbsp -game $game "$($project.MapName).vmf"
}

function Run-Vvis( $project ) {
    $vvis = "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\bin\vvis.exe"
    & $vvis -game $game "$($project.MapName).vmf"
}

function Run-Vrad( $project ) {
    $vrad = "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\bin\vrad.exe"
    & $vrad -game $game "$($project.MapName).vmf"
}

function Copy-Map( $project ) {
    Copy-Item "$($project.MapName).bsp" "C:\Program Files (x86)\steam\steamapps\common\team fortress 2\tf\maps" -Force
}
