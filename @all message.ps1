$computers = Get-ADcomputer -filter * -SearchBase "<PUT DISTINGUISHED NAME HERE>"
$ms = """
hello,
this is a reminder to switch of any pcs, lights and aircons in your rooms
"""
$timeout = 10

foreach ($computer in $computers)
{
    try
    {
        $pcName = $computer.Name
        Write-Output "$($pcName)"

        $msgProcess = Start-Process -FilePath "msg" -ArgumentList "/Server:$pcName * $ms" -PassThru
        
        $msgProcess.WaitForExit($timeout * 100) 
        
        if (!$msgProcess.HasExited)
        {
            Write-Output "Timeout reached while trying to contact $($pcName), skipping..."
            $msgProcess.Kill()
        }
    }
    catch
    {
        Write-Output "couldnt contact $($pcName)"
    }
}
