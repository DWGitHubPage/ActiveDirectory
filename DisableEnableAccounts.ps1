# To disable an account:

PS C:\> Disable-ADAccount -Identity bcumberbatch


# To check that the account is disabled:

Get-ADUser bcumberbatch |select name,enabled


# To enable an account:

Get-ADUser bcumberbatch | Enable-ADAccount
