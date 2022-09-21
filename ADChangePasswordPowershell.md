Changing a client's password from the Powershell.

net user USERNAME NEwPASSWORD

For extra security, use "net user USERNAME *" so no one around you will be able to see the password on your screen

If the username consists of more than one word, put it inside quotation marks.

To change a password for a domain user:
net user /domain USERNAME NEWPASS

Another way to change password with a domain user in Powershell:

Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$newPass" -Force)
