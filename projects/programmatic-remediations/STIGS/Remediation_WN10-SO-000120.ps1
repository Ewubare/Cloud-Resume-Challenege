<#
.SYNOPSIS
    This PowerShell script configures the Windows SMB server to always perform SMB packet signing to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000120

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-SO-000120.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-SO-000120 - The Windows SMB server must be configured to always perform SMB packet signing..."

try {
    # Set the RequireSecuritySignature registry value to enable SMB server packet signing
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" -Name "RequireSecuritySignature" -Value 1 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}