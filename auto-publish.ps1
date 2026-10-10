# --- Settings ---
$Vault        = "G:\My Drive\animer"
$Quartz       = "C:\Users\Phil\quartz"
$ExcludeDirs  = @("GM Notes", ".obsidian", ".git", ".trash")   # folders that must never be published
$IntervalSecs = 10

Set-Location $Quartz
Write-Host "Watching $Vault every $IntervalSecs seconds. Ctrl+C to stop."

while ($true) {
    Write-Host "Committing Changes..."
    git add .
    git commit -m "Auto-update notes $(Get-Date -Format 'yyyy-MM-dd HH:mm')" | Out-Null
    git push
    Write-Host "$(Get-Date -Format T) Published changes."

    Start-Sleep -Seconds $IntervalSecs
}