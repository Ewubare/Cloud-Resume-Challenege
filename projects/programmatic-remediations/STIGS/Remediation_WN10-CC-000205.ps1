<#
.SYNOPSIS
    This PowerShell script configures Windows Telemetry to not be set to Full to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000205

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000205.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000205 - Windows Telemetry must not be configured to Full..."

try {
    # Set the AllowTelemetry registry value to 1 (Basic) instead of 3 (Full)
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 1 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}