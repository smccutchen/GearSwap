# Soverance Automation Tools
# Scott McCutchen
# Enterprise Architect - Soverance Studios
# scott.mccutchen@soverance.com

param(
    [string]$FFXIDir = "C:\Program Files (x86)\PlayOnline\SquareEnix"
)

#region Main
##############################################
###
###  MAIN
###
##############################################

try
{
    $Executables = @(
        (Join-Path $FFXIDir "FINAL FANTASY XI\polboot.exe"),
        (Join-Path $FFXIDir "PlayOnlineViewer\pol.exe")
    )

    $RegPath = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"

    # Ensure the registry key exists
    if (!(Test-Path $RegPath))
    {
        New-Item -Path $RegPath -Force | Out-Null
    }

    foreach ($Exe in $Executables)
    {
        if (!(Test-Path $Exe))
        {
            Write-Warning "Executable not found: $Exe"
            continue
        }

        $ExistingValue = Get-ItemProperty -Path $RegPath -Name $Exe -ErrorAction SilentlyContinue

        if ($ExistingValue)
        {
            Write-Host "DPI override already set for $Exe"
        }
        else
        {
            Set-ItemProperty -Path $RegPath -Name $Exe -Value "~ HIGHDPIAWARE" -Type String
            Write-Host "Applied DPI scaling override for $Exe"
        }
    }

    Write-Host "High DPI fix complete."
}
catch
{
    Write-Error "[ERROR] in $($MyInvocation.MyCommand) on line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    exit 1
}
#endregion
