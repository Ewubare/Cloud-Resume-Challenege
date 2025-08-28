<#
.SYNOPSIS
    This PowerShell script sets the account lockout duration to 15 minutes to comply with security policy.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-7
    Last Modified   : 2025-7-7
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-AC-000005.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-AC-000005 - Setting account lockout duration to 15 minutes..."

try {
    net accounts /lockoutduration:15
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}
