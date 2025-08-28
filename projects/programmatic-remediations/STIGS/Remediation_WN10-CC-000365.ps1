<#
.SYNOPSIS
    This PowerShell script configures Windows 10 to prevent Windows apps from being activated by voice while the system is locked to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000365

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000365.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000365 - Windows 10 must be configured to prevent Windows apps from being activated by voice while the system is locked..."

try {
    # Create the registry path if it doesn't exist
    $RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }
    
    # Set the LetAppsActivateWithVoiceAboveLock registry value to 2 (Force Deny)
    Set-ItemProperty -Path $RegistryPath -Name "LetAppsActivateWithVoiceAboveLock" -Value 2 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}