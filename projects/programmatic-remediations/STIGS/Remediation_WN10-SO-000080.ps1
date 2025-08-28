<#
.SYNOPSIS
    This PowerShell script configures the Windows dialog box title for the legal banner to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000080

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-SO-000080.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-SO-000080 - The Windows dialog box title for the legal banner must be configured..."

try {
    # Set the LegalNoticeCaption registry value for the legal banner title
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LegalNoticeCaption" -Value "DoD Notice and Consent Banner" -Type String
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}