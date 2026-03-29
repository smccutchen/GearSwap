# Soverance Automation Tools
# Scott McCutchen
# Enterprise Architect - Soverance Studios
# scott.mccutchen@soverance.com

param(
    [string]$InstallDir = (Join-Path $env:ProgramFiles "Windower4"),
    [string]$ConfigFile = (Join-Path $PSScriptRoot "windower-packages.json"),
    [switch]$DeployGearSwap
)

#region Main
##############################################
###
###  MAIN
###
##############################################

try
{
    ##############################
    ## Download Windower
    ##############################

    if (!(Test-Path $InstallDir))
    {
        New-Item -ItemType Directory -Path $InstallDir | Out-Null
        Write-Host "Created install directory: $InstallDir"
    }

    $Url = "https://files.windower.net/4/live/Windower.exe"
    $OutFile = Join-Path $InstallDir "Windower.exe"
    $SkipDownload = $false

    if (Test-Path $OutFile)
    {
        Write-Host "Windower.exe already exists at $OutFile"
        Write-Host "Windower self-updates on launch, so this may already be up to date."
        $Overwrite = Read-Host "Overwrite? (y/n)"

        if ($Overwrite -ne "y")
        {
            Write-Host "Skipping download."
            $SkipDownload = $true
        }
    }

    if (!$SkipDownload)
    {
        Write-Host "Downloading Windower ..."

        # Use HttpClient for download progress tracking
        $Handler = New-Object System.Net.Http.HttpClientHandler
        $Handler.AllowAutoRedirect = $true
        $HttpClient = New-Object System.Net.Http.HttpClient($Handler)
        $Response = $HttpClient.GetAsync($Url, [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead).Result
        $Response.EnsureSuccessStatusCode() | Out-Null
        $TotalBytes = $Response.Content.Headers.ContentLength
        $Stream = $Response.Content.ReadAsStreamAsync().Result
        $FileStream = [System.IO.File]::Create($OutFile)
        $Buffer = New-Object byte[] 8192
        $BytesRead = 0
        $TotalRead = [long]0

        while (($BytesRead = $Stream.Read($Buffer, 0, $Buffer.Length)) -gt 0)
        {
            $FileStream.Write($Buffer, 0, $BytesRead)
            $TotalRead += $BytesRead

            if ($TotalBytes -gt 0)
            {
                $Percent = [math]::Round(($TotalRead / $TotalBytes) * 100, 1)
                $TotalMB = [math]::Round($TotalBytes / 1MB, 1)
                $ReadMB = [math]::Round($TotalRead / 1MB, 1)
                Write-Progress -Activity "Downloading Windower" -Status "$ReadMB MB / $TotalMB MB ($Percent%)" -PercentComplete $Percent
            }
        }

        $FileStream.Close()
        $Stream.Close()
        $HttpClient.Dispose()
        Write-Progress -Activity "Downloading Windower" -Completed
        Write-Host "Downloaded Windower to $OutFile"
    }

    ##############################
    ## Install Addons & Plugins
    ##############################

    if (!(Test-Path $ConfigFile))
    {
        Write-Error "Config file not found: $ConfigFile"
        exit 1
    }

    $Config = Get-Content $ConfigFile -Raw | ConvertFrom-Json
    $AddonsDir = Join-Path $InstallDir "addons"
    $ScriptsDir = Join-Path $InstallDir "scripts"

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
        $AddonResponse = Invoke-RestMethod -Uri $ApiUrl -Headers $Headers -UseBasicParsing

        New-Item -ItemType Directory -Path $AddonDir | Out-Null

        foreach ($Item in $AddonResponse)
        {
            if ($Item.type -eq "file")
            {
                $AddonFile = Join-Path $AddonDir $Item.name
                Write-Host "  Downloading $($Item.name) ..."
                Invoke-WebRequest -Uri $Item.download_url -OutFile $AddonFile -Headers $Headers -UseBasicParsing
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

    # Deploy custom init.txt for plugin auto-load configuration
    $RepoInitFile = Join-Path $PSScriptRoot "init.txt"
    $DestInitFile = Join-Path $ScriptsDir "init.txt"

    if (Test-Path $RepoInitFile)
    {
        Copy-Item -Path $RepoInitFile -Destination $DestInitFile -Force
        Write-Host "Deployed init.txt to $DestInitFile"
    }
    else
    {
        Write-Warning "init.txt not found in repo root: $RepoInitFile"
    }

    ##############################
    ## Deploy GearSwap Data
    ##############################

    if ($DeployGearSwap)
    {
        $GearSwapDataDir = Join-Path $InstallDir "addons\GearSwap\data"

        if (!(Test-Path $GearSwapDataDir))
        {
            Write-Warning "GearSwap data directory not found: $GearSwapDataDir"
            Write-Warning "GearSwap addon may not be installed yet. Skipping deployment."
        }
        else
        {
            $RepoRoot = $PSScriptRoot

            # Find all character folders containing .lua files
            $CharacterFolders = Get-ChildItem -Path $RepoRoot -Directory | Where-Object {
                (Get-ChildItem -Path $_.FullName -Filter "*.lua" -ErrorAction SilentlyContinue).Count -gt 0
            }

            if ($CharacterFolders.Count -eq 0)
            {
                Write-Warning "No character folders with .lua files found in $RepoRoot"
            }
            else
            {
                foreach ($Folder in $CharacterFolders)
                {
                    $DestDir = Join-Path $GearSwapDataDir $Folder.Name

                    if (!(Test-Path $DestDir))
                    {
                        New-Item -ItemType Directory -Path $DestDir | Out-Null
                        Write-Host "Created character directory: $DestDir"
                    }

                    $LuaFiles = Get-ChildItem -Path $Folder.FullName -Filter "*.lua"

                    foreach ($LuaFile in $LuaFiles)
                    {
                        $DestFile = Join-Path $DestDir $LuaFile.Name
                        Copy-Item -Path $LuaFile.FullName -Destination $DestFile -Force
                        Write-Host "Deployed $($Folder.Name)/$($LuaFile.Name)"
                    }
                }

                Write-Host "GearSwap deployment complete."
            }
        }
    }

    ##############################
    ## Launch Windower
    ##############################

    Write-Host "Launching Windower for initial setup ..."
    Start-Process -FilePath $OutFile -WorkingDirectory $InstallDir
    Write-Host "Windower launched. It will automatically download the latest updates on first run."
    Write-Host "Note: Plugins will be downloaded automatically by the Windower launcher."
}
catch
{
    Write-Error "[ERROR] in $($MyInvocation.MyCommand) on line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    exit 1
}
#endregion
