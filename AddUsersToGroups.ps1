# Scripts to add a user to a group or more than one group at a time.


# One-liner to add a user to a group:

Add-AdGroupMember -Identity 'HelpDesk' -Members 'bcumberbatch'


# To add a user to multiple groups:

$User = bcumberbatch

$Groups = @("HelpDesk","group1","group2")

ForEach ($Group in $Groups) {

  Add-ADPrincipalGroupMembership $User  -MemberOf  $Group

}


# A one-liner to add a user to multiple groups:

$Groups = @("HelpDesk","group1","group2"); ForEach ($Group in $Groups) {Add-ADPrincipalGroupMembership <bcumberbatch>   -MemberOf $Group}
