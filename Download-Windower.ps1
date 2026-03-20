# Soverance Automation Tools
# Scott McCutchen
# Enterprise Architect - Soverance Studios
# scott.mccutchen@soverance.com

param(
    [string]$InstallDir = (Join-Path $env:ProgramFiles "Windower4")
)

#region Main
##############################################
###
###  MAIN
###
##############################################

try
{
    if (!(Test-Path $InstallDir))
    {
        New-Item -ItemType Directory -Path $InstallDir | Out-Null
        Write-Host "Created install directory: $InstallDir"
    }

    $Url = "https://update.windower.net/live/Windower.exe"
    $OutFile = Join-Path $InstallDir "Windower.exe"

    if (Test-Path $OutFile)
    {
        Write-Host "Windower.exe already exists at $OutFile"
        Write-Host "Windower self-updates on launch, so this may already be up to date."
        $Overwrite = Read-Host "Overwrite? (y/n)"

        if ($Overwrite -ne "y")
        {
            Write-Host "Skipping download."
            return
        }
    }

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

    # Launch Windower so it can self-update and initialize
    Write-Host "Launching Windower for initial setup ..."
    Start-Process -FilePath $OutFile -WorkingDirectory $InstallDir
    Write-Host "Windower launched. It will automatically download the latest updates on first run."
}
catch
{
    Write-Error "[ERROR] in $($MyInvocation.MyCommand) on line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    exit 1
}
#endregion
