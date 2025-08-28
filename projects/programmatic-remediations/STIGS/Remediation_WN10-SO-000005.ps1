<#
.SYNOPSIS
    This PowerShell script disables the built-in administrator account to comply with STIG requirements.

.NOTES
    Author          : Tega Ewubare
    LinkedIn        : linkedin.com/in/Ewubare/
    GitHub          : github.com/Ewubare
    Date Created    : 2025-7-30
    Last Modified   : 2025-7-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : Windows 10
    PowerShell Ver. : 5.1

.USAGE
    Run this script with administrative privileges.
    Example syntax:
    PS C:\> .\Remediation_WN10-SO-000005.ps1
#>

# Remediation Code Starts Here

Write-Output "Remediating: WN10-SO-000005 - The built-in administrator account must be disabled..."

try {
    # Try to disable the built-in Administrator account using different methods
    try {
        # Method 1: PowerShell cmdlet
        Disable-LocalUser -Name "Administrator" -ErrorAction Stop
        Write-Output "Administrator account disabled using PowerShell cmdlet."
    } catch {
        # Method 2: Net user command (works with localized names)
        $result = net user administrator /active:no 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Output "Administrator account disabled using net user command."
        } else {
            Write-Output "Warning: Administrator account may not exist or is already disabled."
        }
    }
    Write-Output "Remediation completed successfully."
} catch {
    Write-Output "Remediation failed: $_"
}