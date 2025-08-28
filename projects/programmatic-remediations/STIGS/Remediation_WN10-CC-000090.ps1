<#
.SYNOPSIS
    This PowerShell script configures Group Policy objects to be reprocessed even if they have not changed to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000090.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000090 - Group Policy objects must be reprocessed even if they have not changed..."

try {
    # Create the registry path if it doesn't exist
    $RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }
    
    # Set the NoGPOListChanges registry value to 0 to force reprocessing
    Set-ItemProperty -Path $RegistryPath -Name "NoGPOListChanges" -Value 0 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}