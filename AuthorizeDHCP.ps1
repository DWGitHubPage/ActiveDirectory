# Authorizing DHCP Server in Active Directory. Especially helpful to avoid rogue DHCP servers.


# To see all the authorized DHCP Servers in Active Directory:

Get-DhcpServerInDC

# Authorizing DHCP Server using Netsh on the Command Line:

netsh dhcp add server <server name> <ip address>

# To unauthorize a DHCP Server with Netsh on the Command Line:

netsh dhcp delete server <server name> <ip address>

# To confirm your action:

netsh dhcp show server

# To authorize DHCP Server in PowerShell:

Add-DhcpServerInDC -DnsName "yourdnsnameserveraddress" -IPAddress 10.10.10.50

# To unauthorize DHCP Server in PowerShell (Replace the IP address with your IP address):

Remove-DhcpServerInDC -DnsName "yourdnsnameserveraddress" -IPAddress 10.10.10.80

# To get the DNS Server address in PowerShell:

PS C:\> Get-DnsServer -ComputerName "yourIPaddress"

# To get the DNS Server address from Linux/macOS:

dig ns your-domain-name

# Or:

host -t ns domain-name-com-here
