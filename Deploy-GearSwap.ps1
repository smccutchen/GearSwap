# Soverance Automation Tools
# Scott McCutchen
# Enterprise Architect - Soverance Studios
# scott.mccutchen@soverance.com

param(
    [string]$WindowerDir = (Join-Path $env:ProgramFiles "Windower4")
)

#region Main
##############################################
###
###  MAIN
###
##############################################

try
{
    $GearSwapDataDir = Join-Path $WindowerDir "addons\GearSwap\data"

    if (!(Test-Path $GearSwapDataDir))
    {
        Write-Error "GearSwap data directory not found: $GearSwapDataDir"
        Write-Error "Make sure Windower and the GearSwap addon are installed first."
        exit 1
    }

    $RepoRoot = $PSScriptRoot

    # Find all character folders containing .lua files
    $CharacterFolders = Get-ChildItem -Path $RepoRoot -Directory | Where-Object {
        (Get-ChildItem -Path $_.FullName -Filter "*.lua" -ErrorAction SilentlyContinue).Count -gt 0
    }

    if ($CharacterFolders.Count -eq 0)
    {
        Write-Error "No character folders with .lua files found in $RepoRoot"
        exit 1
    }

    foreach ($Folder in $CharacterFolders)
    {
        $DestDir = Join-Path $GearSwapDataDir $Folder.Name

        if (!(Test-Path $DestDir))
        {
            New-Item -ItemType Directory -Path $DestDir | Out-Null
            Write-Host "Created character directory: $DestDir"
        }

        $LuaFiles = Get-ChildItem -Path $Folder.FullName -Filter "*.lua"

        foreach ($File in $LuaFiles)
        {
            $DestFile = Join-Path $DestDir $File.Name
            Copy-Item -Path $File.FullName -Destination $DestFile -Force
            Write-Host "Deployed $($Folder.Name)/$($File.Name)"
        }
    }

    Write-Host "GearSwap deployment complete."
}
catch
{
    Write-Error "[ERROR] in $($MyInvocation.MyCommand) on line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    exit 1
}
#endregion
