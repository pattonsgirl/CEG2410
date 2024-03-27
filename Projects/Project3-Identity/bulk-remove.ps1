Import-Csv users.csv | foreach {

    Remove-ADUser -Identity $($_.SamAccountName) -Confirm:$false

}