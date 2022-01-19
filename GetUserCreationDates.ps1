# To know when a user profile was created:

Get-ADUser <bcumberbatch> -Properties whenCreated | Select Name,whenCreated

# To get the creation dates of all Active Directory users:

Get-ADUser -Filter * -Properties * | Select Name, whenCreated | Sort-Object whenCreated

# To get creation dates of all Active Directory users in the last number of days:

# For this example, going back thirty days.
$prvDate = ((Get-Date).AddDays(-30)).Date
Get-ADUser -Filter {whenCreated -ge $prvDate} -Properties whenCreated | Select Name, whenCreated | Sort-Object whenCreated
