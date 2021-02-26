param ($Path, $envname='D:\Work\New\Export\Syneos\exp.csv')
Write-Verbose $Path

$re = '(?:^|,)(?:\"(?:[^\"]+|\"\")*\"|[^,]*)'
Write-Host "Processing $path"
$wasError = $false;
$csv = Get-Content $path
$count = [regex]::matches($csv[0], $re).groups.count
$csv | Select -Skip 1 | % {
  if([regex]::matches($_, $re).groups.count -eq $count) {
    #Write-Host "ok"
  } else {
    Write-Host $_ -ForegroundColor Red;
    $wasError = $true;
  }
}
    
If ($wasError -eq $true)
{
    Write-Host "Processing complete." -ForegroundColor red
}
else
{
    Write-Host "Processing complete." -ForegroundColor Green
}