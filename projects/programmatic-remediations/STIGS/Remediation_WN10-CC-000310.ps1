<#
.SYNOPSIS
    This PowerShell script prevents users from changing installation options to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000310.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000310 - Users must be prevented from changing installation options..."

try {
    # Create the registry path if it doesn't exist
    $RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }
    
    # Set the EnableUserControl registry value to 0 to prevent users from changing installation options
    Set-ItemProperty -Path $RegistryPath -Name "EnableUserControl" -Value 0 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}