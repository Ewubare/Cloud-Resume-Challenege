<#
.SYNOPSIS
    This PowerShell script configures Windows 10 to audit MPSSVC Rule-Level Policy Change Failures to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000580

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-AU-000580.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-AU-000580 - Windows 10 must be configured to audit MPSSVC Rule-Level Policy Change Failures..."

try {
    # Enable auditing for MPSSVC Rule-Level Policy Change failures using auditpol
    auditpol /set /subcategory:"MPSSVC Rule-Level Policy Change" /failure:enable
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}