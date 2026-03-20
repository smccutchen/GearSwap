# Soverance Automation Tools
# Scott McCutchen
# Enterprise Architect - Soverance Studios
# scott.mccutchen@soverance.com

param(
    [string]$WindowerDir = (Join-Path $env:ProgramFiles "Windower4"),
    [string]$ConfigFile = (Join-Path $PSScriptRoot "windower-packages.json")
)

#region Main
##############################################
###
###  MAIN
###
##############################################

try
{
    if (!(Test-Path $ConfigFile))
    {
        Write-Error "Config file not found: $ConfigFile"
        exit 1
    }

    $Config = Get-Content $ConfigFile -Raw | ConvertFrom-Json
    $AddonsDir = Join-Path $WindowerDir "addons"
    $ScriptsDir = Join-Path $WindowerDir "scripts"

    if (!(Test-Path $AddonsDir))
    {
        New-Item -ItemType Directory -Path $AddonsDir | Out-Null
    }

    if (!(Test-Path $ScriptsDir))
    {
        New-Item -ItemType Directory -Path $ScriptsDir | Out-Null
    }

    # Download addons from the official Windower/Lua GitHub repository
    $BaseUrl = "https://api.github.com/repos/Windower/Lua/contents/addons"
    $Headers = @{ "User-Agent" = "Soverance-Windower-Installer" }

    foreach ($Addon in $Config.addons)
    {
        $AddonDir = Join-Path $AddonsDir $Addon

        if (Test-Path $AddonDir)
        {
            Write-Host "Skipping addon '$Addon' (already installed)"
            continue
        }

        Write-Host "Installing addon '$Addon' ..."

        # Get the list of files in the addon directory from GitHub
        $ApiUrl = "$BaseUrl/$Addon"
        $Response = Invoke-RestMethod -Uri $ApiUrl -Headers $Headers -UseBasicParsing

        New-Item -ItemType Directory -Path $AddonDir | Out-Null

        foreach ($Item in $Response)
        {
            if ($Item.type -eq "file")
            {
                $OutFile = Join-Path $AddonDir $Item.name
                Write-Host "  Downloading $($Item.name) ..."
                Invoke-WebRequest -Uri $Item.download_url -OutFile $OutFile -Headers $Headers -UseBasicParsing
            }
            elseif ($Item.type -eq "dir")
            {
                # Handle one level of subdirectories
                $SubDir = Join-Path $AddonDir $Item.name
                New-Item -ItemType Directory -Path $SubDir | Out-Null

                $SubResponse = Invoke-RestMethod -Uri $Item.url -Headers $Headers -UseBasicParsing

                foreach ($SubItem in $SubResponse)
                {
                    if ($SubItem.type -eq "file")
                    {
                        $SubOutFile = Join-Path $SubDir $SubItem.name
                        Write-Host "  Downloading $($Item.name)/$($SubItem.name) ..."
                        Invoke-WebRequest -Uri $SubItem.download_url -OutFile $SubOutFile -Headers $Headers -UseBasicParsing
                    }
                }
            }
        }

        Write-Host "Installed addon '$Addon'"
    }

    # Configure plugins for auto-load via init.txt
    # Plugins are managed by the Windower launcher, but we can tell it which ones to load
    $InitFile = Join-Path $ScriptsDir "init.txt"
    $InitLines = @()

    if (Test-Path $InitFile)
    {
        $InitLines = @(Get-Content $InitFile)
    }

    $Changed = $false

    foreach ($Plugin in $Config.plugins)
    {
        $LoadCommand = "load $Plugin"

        if ($InitLines -notcontains $LoadCommand)
        {
            $InitLines += $LoadCommand
            Write-Host "Added plugin '$Plugin' to auto-load (init.txt)"
            $Changed = $true
        }
        else
        {
            Write-Host "Plugin '$Plugin' already in init.txt"
        }
    }

    if ($Changed)
    {
        $InitLines | Set-Content $InitFile
        Write-Host "Updated $InitFile"
    }

    Write-Host "Done. Addons installed and plugins configured."
    Write-Host "Note: Plugins will be downloaded automatically by the Windower launcher on next launch."
}
catch
{
    Write-Error "[ERROR] in $($MyInvocation.MyCommand) on line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    exit 1
}
#endregion
