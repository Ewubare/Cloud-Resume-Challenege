<#
.SYNOPSIS
    This PowerShell script configures Windows 10 to have command line process auditing events enabled for failures to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000585

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-AU-000585.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-AU-000585 - Windows 10 must have command line process auditing events enabled for failures..."

try {
    # Enable auditing for Process Creation failures using auditpol
    auditpol /set /subcategory:"Process Creation" /failure:enable
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}