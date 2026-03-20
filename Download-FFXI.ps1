# Soverance Automation Tools
# Scott McCutchen
# Enterprise Architect - Soverance Studios
# scott.mccutchen@soverance.com

param(
    [string]$InstallDir = (Join-Path $env:USERPROFILE "Downloads\FFXI")
)

#region Main
##############################################
###
###  MAIN
###
##############################################

try
{
    $DownloadDir = $InstallDir

    if (!(Test-Path $DownloadDir))
    {
        New-Item -ItemType Directory -Path $DownloadDir | Out-Null
        Write-Host "Created download directory: $DownloadDir"
    }

    $BaseUrl = "https://gdl.square-enix.com/ffxi/download/us"

    $Files = @(
        "FFXIFullSetup_US.part1.exe",
        "FFXIFullSetup_US.part2.rar",
        "FFXIFullSetup_US.part3.rar",
        "FFXIFullSetup_US.part4.rar",
        "FFXIFullSetup_US.part5.rar"
    )

    foreach ($File in $Files)
    {
        $Url = "$BaseUrl/$File"
        $OutFile = Join-Path $DownloadDir $File

        if (Test-Path $OutFile)
        {
            Write-Host "Skipping $File (already exists)"
            continue
        }

        Write-Host "Downloading $File ..."

        # Use HttpClient for download progress tracking
        $HttpClient = New-Object System.Net.Http.HttpClient
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
                Write-Progress -Activity "Downloading $File" -Status "$ReadMB MB / $TotalMB MB ($Percent%)" -PercentComplete $Percent
            }
        }

        $FileStream.Close()
        $Stream.Close()
        $HttpClient.Dispose()
        Write-Progress -Activity "Downloading $File" -Completed
        Write-Host "Downloaded $File"
    }

    Write-Host "All files downloaded to $DownloadDir"

    # Run the self-extracting installer (part1.exe), which extracts all parts
    $InstallerPath = Join-Path $DownloadDir "FFXIFullSetup_US.part1.exe"
    Write-Host "Extracting installer from $InstallerPath ..."
    Start-Process -FilePath $InstallerPath -WorkingDirectory $DownloadDir -Wait

    # After extraction, run FFXISETUP.exe from the extracted folder
    $SetupPath = Join-Path $DownloadDir "FFXIFullSetup_US\FFXISETUP.exe"

    if (Test-Path $SetupPath)
    {
        Write-Host "Launching FFXI Setup ..."
        Start-Process -FilePath $SetupPath -Wait
        Write-Host "FFXI installation complete."
    }
    else
    {
        Write-Error "FFXISETUP.exe not found at $SetupPath. Extraction may have failed or used a different output directory."
    }
}
catch
{
    Write-Error "[ERROR] in $($MyInvocation.MyCommand) on line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    exit 1
}
#endregion
