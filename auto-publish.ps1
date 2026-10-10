$Quartz       = "C:\Users\Phil\quartz"
$IntervalSecs = 60

Set-Location $Quartz
Write-Host "Checking for changes every $IntervalSecs seconds. Ctrl+C to stop."

while ($true) {
    if (git status --porcelain) {
        git add -A
        git commit -m "Auto-update notes $(Get-Date -Format 'yyyy-MM-dd HH:mm')" | Out-Null
        git pull --rebase --autostash | Out-Null
        git push
        Write-Host "$(Get-Date -Format T) Published changes."
    }
    Start-Sleep -Seconds $IntervalSecs
}