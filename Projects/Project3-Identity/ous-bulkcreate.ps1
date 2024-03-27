Import-Csv ous.csv |
foreach {
    # quotes around this worked for me.  If yours is not working, try without the quotes
    "New-ADOrganizationalUnit -Name $_.Name -Path $_.Path `
    -ProtectedFromAccidentalDeletion $true -PassThru"
}
