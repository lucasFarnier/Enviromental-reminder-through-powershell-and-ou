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
        
        # Wait for the msg process to exit with a timeout
        $msgProcess.WaitForExit($timeout * 100)  # Timeout in milliseconds
        
        # If the process did not exit within the timeout
        if (!$msgProcess.HasExited)
        {
            Write-Output "Timeout reached while trying to contact $($pcName), skipping..."
            $msgProcess.Kill()  # Kill the process if it hasn't finished
        }
    }
    catch
    {
        Write-Output "couldnt contact $($pcName)"
    }
}
