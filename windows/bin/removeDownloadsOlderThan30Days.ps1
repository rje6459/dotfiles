Get-ChildItem "C:\Users\$ENV:USERNAME\Downloads" -Recurse -File | Where LastWriteTime -lt (Get-Date).AddDays(-30) | Remove-Item -Force
Get-ChildItem "C:\Users\$ENV:USERNAME\Downloads" -Recurse | Where {$_.PSIsContainer -and @(Get-ChildItem -LiteralPath $_.FullName -Recurse | Where {!$_.PSIsContainer}).Length -eq 0} | Remove-Item -Recurse