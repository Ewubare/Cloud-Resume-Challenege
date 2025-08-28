<#
.SYNOPSIS
    This PowerShell script sets the LanMan authentication level to send NTLMv2 response only and refuse LM and NTLM to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000205

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-SO-000205.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-SO-000205 - The LanMan authentication level must be set to send NTLMv2 response only, and to refuse LM and NTLM..."

try {
    # Set the LmCompatibilityLevel registry value to 5 (Send NTLMv2 response only, refuse LM and NTLM)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LmCompatibilityLevel" -Value 5 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}