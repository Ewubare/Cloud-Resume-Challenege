<#
.SYNOPSIS
    This PowerShell script configures the Windows Remote Management (WinRM) client to not use Digest authentication to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000360

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-CC-000360.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-CC-000360 - The Windows Remote Management (WinRM) client must not use Digest authentication..."

try {
    # Create the registry path if it doesn't exist
    $RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }
    
    # Set the AllowDigest registry value to 0 to disable Digest authentication for WinRM client
    Set-ItemProperty -Path $RegistryPath -Name "AllowDigest" -Value 0 -Type DWord
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}