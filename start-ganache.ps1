# Start Ganache in the background
Write-Host "Starting Ganache blockchain..." -ForegroundColor Green
Start-Process -WindowStyle Hidden -FilePath "ganache" -ArgumentList "--host", "127.0.0.1", "--port", "7545", "--deterministic", "--accounts", "10", "--defaultBalanceEther", "1000"
Start-Sleep 3
Write-Host "Ganache should be running on http://127.0.0.1:7545" -ForegroundColor Green
Write-Host "You can check if it's running with: netstat -an | Select-String 7545" -ForegroundColor Yellow