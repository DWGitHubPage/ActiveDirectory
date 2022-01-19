# Installing modules for Active Directory.


# Installing RSAT:

Enable-WindowsOptionalFeature -Online -FeatureName RSATClient-Roles-AD-Powershell


# Installing the Windows Compatibility module:

Install-Module -Name WindowsCompatibility


# To get the Active Directory module for PowerShell:

Import-Module ActiveDirectory


# To confirm that the AD module is installed and imported to the session:

Get-Module ActiveDirectory


# To list all imported modules in a PowerShell session:

Get-Module –ListAvailable


# Exporting the Active Directory module from a remote computer/server:

$S = New-PSSession -ComputerName MyDomainController

Export-PSsession -Session $S -Module ActiveDirectory -OutputModule RemoteAD

Remove-PSSession -Session $S

Import-Module RemoteAD


# To the list of available cmdlets for working with Active Directory:

Get-Command -Module ActiveDirectory


# To get the list of Active Directory domain controllers:

Get-ADDomainController –filter *| format-table
