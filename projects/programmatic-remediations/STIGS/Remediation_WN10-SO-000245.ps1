<#
.SYNOPSIS
    This PowerShell script enables UAC approval mode for the built-in Administrator account to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000245

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-SO-000245.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-SO-000245 - User Account Control approval mode for the built-in Administrator must be enabled..."

try {
    # Set the FilterAdministratorToken registry value to enable UAC approval mode
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "FilterAdministratorToken" -Value 1 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}