<#
.SYNOPSIS
    This PowerShell script ensures that users are prompted for a password on resume from sleep when on battery power using Group Policy registry settings.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-7
    Last Modified   : 2025-7-7
    Version         : 1.1
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000145.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000145 - Enforcing password prompt on resume from sleep (on battery)..."

try {
    # Set Group Policy registry value for "Require a password when a computer wakes (on battery)"
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }
    New-ItemProperty -Path $registryPath -Name "DCSettingIndex" -PropertyType DWord -Value 1 -Force | Out-Null
    
    # Also apply the powercfg setting for immediate effect
    powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_NONE CONSOLELOCK 1
    powercfg /SETACTIVE SCHEME_CURRENT
    
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}
