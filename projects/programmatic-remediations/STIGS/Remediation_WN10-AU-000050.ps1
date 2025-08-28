<#
.SYNOPSIS
    This PowerShell script configures the system to audit Detailed Tracking - Process Creation successes to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000050

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-AU-000050.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-AU-000050 - The system must be configured to audit Detailed Tracking - Process Creation successes..."

try {
    # Enable auditing for Process Creation successes using auditpol
    auditpol /set /subcategory:"Process Creation" /success:enable
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}