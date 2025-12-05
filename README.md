this is a simple powershell script
that allows a user to @all essentiall pcs within their network through active directory

this can also be switched to do it through users instead:
-replace line 1 "Get-ADcomputer" to "Get-ADuser"
-replace line 10 "{msg /Server:$pcName * $ms}" to "{msg $pcName $ms}"
-the distinguished path to the user area of your active directory
