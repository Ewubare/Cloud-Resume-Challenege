<#
.SYNOPSIS
    This PowerShell script configures the user to be prompted for a password on resume from sleep when plugged in to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000150.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000150 - The user must be prompted for a password on resume from sleep (plugged in)..."

try {
    # Create the registry path if it doesn't exist
    $RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }
    
    # Set the ACSettingIndex registry value to 1 to require password on wake (when plugged in)
    Set-ItemProperty -Path $RegistryPath -Name "ACSettingIndex" -Value 1 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}