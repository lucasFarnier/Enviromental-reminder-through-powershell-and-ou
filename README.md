this is a simple powershell script
that allows a user to @all essentiall pcs within their network through active directory


this script will also kill the current message its doing if not completed within a second (the command to run for each user should take less)


to reduce the time for timeout:
    
    -replace line 17 '($timeout * 100) " to "($timeout * <timeout (will be multiplied by 10)>)'


this can also be switched to do it through users instead:

    -replace line 1 'Get-ADcomputer' to 'Get-ADuser'
  
    -replace line 15 '"msg" -ArgumentList "/Server:$pcName * $ms"' to '"msg" -ArgumentList "$pcName * $ms"'
  
    -the distinguished path to the user area of your active directory
  

if you want this task to be schedually run i would recommend putting it a schedualed task like [this tutorial](https://woshub.com/run-powershell-script-task-scheduler/)
