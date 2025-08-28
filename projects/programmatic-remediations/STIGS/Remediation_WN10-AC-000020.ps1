<#
.SYNOPSIS
    This PowerShell script configures the password history to 24 passwords remembered to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-AC-000020.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-AC-000020 - The password history must be configured to 24 passwords remembered..."

try {
    # Set password history to 24 passwords using net accounts command
    net accounts /uniquepw:24
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}