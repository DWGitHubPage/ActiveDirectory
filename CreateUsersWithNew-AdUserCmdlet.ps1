$NewUserParameters = @{
    'GivenName' = 'David'
    'Surname' = 'Jones'
    'Name' = 'djones'
    'AccountPassword' = (ConvertTo-SecureString 'p@$$w0rd10' -AsPlainText -Force)
    'ChangePasswordAtLogon' = $true
}
New-AdUser @NewUserParameters
