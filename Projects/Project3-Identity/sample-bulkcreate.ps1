# Sample from Active Directory Management in a Month of Lunches
# Prompt for password for all accounts
$secpass = Read-Host "Enter Default Password for Accounts" -AsSecureString

#TODO: add filename prompt?

# Pipe names.csv file to foreach loop
Import-Csv names.csv |
foreach {
  $name = "$($_.FirstName) $($_.LastName)"

 New-ADUser -GivenName $($_.FirstName) -Surname $($_.LastName) `
 -Name $name -SamAccountName $($_.SamAccountName) `
 -UserPrincipalName "$($_.SamAccountName)@sample.org" `
 -AccountPassword $secpass -Path "cn=Users,dc=sample,dc=org" `
 -Enabled:$true
 # More New-ADUser options: https://docs.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2022-ps
}
