<#
.SYNOPSIS
    This PowerShell script configures accounts to require password expiration to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-00-000090.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-00-000090 - Accounts must be configured to require password expiration..."

try {
    # Set maximum password age to 60 days using net accounts command
    net accounts /maxpwage:60
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}