$checkuser='*bcumberbatch*'

# Information about the user for the last 30 days:

$startDate = (get-date).AddDays(-30)
$DCs = Get-ADDomainController -Filter *
foreach ($DC in $DCs){
$logonevents = Get-Eventlog -LogName Security -InstanceID 4624 -after $startDate -ComputerName $dc.HostName
foreach ($event in $logonevents){
if (($event.ReplacementStrings[5] -notlike '*$') -and ($event.ReplacementStrings[5] -like $checkuser)) {

# When they logged in remotely: 

if ($event.ReplacementStrings[8] -eq 10){
write-host "Type 10: Remote Logon`tDate: "$event.TimeGenerated "`tStatus: Success`tUser: "$event.ReplacementStrings[5] "`tWorkstation: "$event.ReplacementStrings[11] "`tIP Address: "$event.ReplacementStrings[18] "`tDC Name: " $dc.Name
}
# When they logged on to the network.
if ($event.ReplacementStrings[8] -eq 3){
write-host "Type 3: Network Logon`tDate: "$event.TimeGenerated "`tStatus: Success`tUser: "$event.ReplacementStrings[5] "`tWorkstation: "$event.ReplacementStrings[11] "`tIP Address: "$event.ReplacementStrings[18] "`tDC Name: " $dc.Name
}
}
}
}
