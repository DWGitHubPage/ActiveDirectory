

# To view all AD commands:

get-command -Module ActiveDirectory

# To display basic domain information:

Get-ADDomain

# To get the password policy from the logged in domain:

Get-ADDefaultDomainPasswordPolicy

# Backup AD system remotely (change "computer1" with the name of the computer and replace "Backup-Path" with your backup path):

invoke-command -ComputerName computer1 -scriptblock {wbadmin start systemstateback up -backupTarget:"Backup-Path" -quiet}

# To get all active users in the domain:

Get-ADUser -Filter *

# To find all users with a certain name:

get-Aduser -Filter {name -like "*paul*"}

# To find all disabled accounts:

Search-ADAccount -AccountDisabled | select name

# To get all accounts that have passwords set to never expire:

get-aduser -filter * -properties Name, PasswordNeverExpires | where {$_.passwordNeverExpires -eq "true" } | Select-Object DistinguishedName,Name,Enabled

# To find all locked accounts:

Search-ADAccount -LockedOut

# To unlock an account:

Unlock-ADAccount –Identity bcumberbatch

# To list all disabled user accounts:

Search-ADAccount -AccountDisabled

# To force a password change at next login:

Set-ADUser -Identity username -ChangePasswordAtLogon $true

# To move a user to a new OU (organizational unit):

Move-ADObject -Identity "CN=Test User (bcumberbatch),OU=ADPRO Users,DC=ad,DC=activedirectorypro,DC=com" -TargetPath "OU=HR,OU=ADPRO Users,DC=ad,DC=activedirectorypro,DC=com"

# To list all computers in a domain:

Get-AdComputer -filter *

# To get all computers from an OU:

Get-ADComputer -SearchBase "OU=DN" -Filter *

# To count all the computers in a domain:

Get-ADComputer -filter * | measure

# To find all computers with a certain version of Windows:

Get-ADComputer -filter {OperatingSystem -Like '*Windows 7*'} -property * | select name, operatingsystem

# To get a count of all the computers and group them by the operating system:

Get-ADComputer -Filter "name -like '*'" -Properties operatingSystem | group -Property operatingSystem | Select Name,Count
