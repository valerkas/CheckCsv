param([String[]]$Path="c:\Test\file.csv")

Write-Host "Processing file..."

$re = '(?:^|,)(?:\"(?:[^\"]+|\"\")*\"|[^,]*)'
$LineNumber = 1;
[bool] $wasError = $false;
$inData = New-Object System.IO.StreamReader($Path)


while ($line = $inData.ReadLine())
{
    if ($LineNumber -eq 1) 
    {
        $headersCount = [regex]::matches($line, $re).groups.count;
        Write-Host "Found $headersCount Headers";
        Write-Debug $line;
    }
    else
    {
        if([regex]::matches($line, $re).groups.count -eq $headersCount) 
        {
            If ($LineNumber % 1000 -eq 0)
            {
                Write-Progress -Activity "Processing file" -Status "Current Count: $LineNumber" #-PercentComplete $percent 
            }
            
        }
        else
        {
            $wasError = $true;
            Write-Host $line -ForegroundColor Red;
        }
    }
    $LineNumber += 1    
}

If ($wasError)
{
    Write-Host "Processing complete." -ForegroundColor red
}
else
{
    Write-Host "Processing complete." -ForegroundColor Green
}

$inData.Dispose()