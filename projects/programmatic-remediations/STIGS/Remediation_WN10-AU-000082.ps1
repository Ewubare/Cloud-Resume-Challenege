<#
.SYNOPSIS
    This PowerShell script configures Windows 10 to audit Object Access - File Share successes to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000082

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-AU-000082.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-AU-000082 - Windows 10 must be configured to audit Object Access - File Share successes..."

try {
    # Enable auditing for File Share successes using auditpol
    auditpol /set /subcategory:"File Share" /success:enable
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}