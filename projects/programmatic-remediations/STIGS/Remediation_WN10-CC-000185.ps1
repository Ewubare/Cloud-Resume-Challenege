<#
.SYNOPSIS
    This PowerShell script configures the system to prevent autorun commands by setting the default autorun behavior.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-7
    Last Modified   : 2025-7-7
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000185

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000185.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000185 - Preventing autorun commands..."

try {
    $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }
    New-ItemProperty -Path $registryPath -Name "NoAutorun" -PropertyType DWord -Value 1 -Force | Out-Null
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}