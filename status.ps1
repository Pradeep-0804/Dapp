# Blockchain DApp Status Script
Write-Host "=== Blockchain DApp Status ===" -ForegroundColor Green
Write-Host ""

# Check Ganache (Blockchain)
$ganacheRunning = netstat -an | findstr "7545"
if ($ganacheRunning) {
    Write-Host "✅ Ganache Blockchain: RUNNING on http://localhost:7545" -ForegroundColor Green
} else {
    Write-Host "❌ Ganache Blockchain: NOT RUNNING" -ForegroundColor Red
}

# Check Frontend Server
$frontendRunning = netstat -an | findstr "3000"
if ($frontendRunning) {
    Write-Host "✅ Frontend Server: RUNNING on http://localhost:3000" -ForegroundColor Green
} else {
    Write-Host "❌ Frontend Server: NOT RUNNING" -ForegroundColor Red
}

Write-Host ""
Write-Host "=== Contract Information ===" -ForegroundColor Yellow
Write-Host "Contract Address: 0xCfEB869F69431e42cdB54A4F4f105C19C080A601" -ForegroundColor Cyan
Write-Host "Network ID: 1759050952608" -ForegroundColor Cyan
Write-Host ""

Write-Host "=== How to Access ===" -ForegroundColor Yellow
Write-Host "1. Open your web browser" -ForegroundColor White
Write-Host "2. Go to: http://localhost:3000" -ForegroundColor Cyan
Write-Host "3. The DApp will automatically connect to the blockchain" -ForegroundColor White
Write-Host ""

Write-Host "=== Available Actions ===" -ForegroundColor Yellow
Write-Host "• View current greeting (shows 'hello' initially)" -ForegroundColor White
Write-Host "• Enter new greeting and click Submit" -ForegroundColor White
Write-Host "• Click 'Get Current Greeting' to refresh" -ForegroundColor White
Write-Host ""

Write-Host "=== Background Jobs ===" -ForegroundColor Yellow
Get-Job | Format-Table -AutoSize

Write-Host "To stop services:" -ForegroundColor Red
Write-Host "  Stop-Job -Name 'Job1' # Stops Ganache" -ForegroundColor Gray
Write-Host "  Stop-Job -Name 'Job3' # Stops Frontend" -ForegroundColor Gray