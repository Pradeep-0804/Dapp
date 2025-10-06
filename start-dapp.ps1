# Task Manager DApp Startup Script
Write-Host "=== BLOCKCHAIN TASK MANAGER DAPP STARTUP ===" -ForegroundColor Cyan
Write-Host ""

# Check if Ganache is already running
$ganacheProcess = Get-Process -Name "ganache" -ErrorAction SilentlyContinue
if ($ganacheProcess) {
    Write-Host "✓ Ganache is already running" -ForegroundColor Green
} else {
    Write-Host "Starting Ganache blockchain..." -ForegroundColor Yellow
    Start-Job -ScriptBlock { ganache --host 127.0.0.1 --port 7545 --deterministic --accounts 10 --defaultBalanceEther 1000 } | Out-Null
    Start-Sleep 5
    Write-Host "✓ Ganache started on http://127.0.0.1:7545" -ForegroundColor Green
}

# Deploy contracts
Write-Host "Deploying smart contracts..." -ForegroundColor Yellow
$deployResult = & truffle migrate --reset 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Smart contracts deployed successfully" -ForegroundColor Green
} else {
    Write-Host "✗ Contract deployment failed" -ForegroundColor Red
    Write-Host $deployResult -ForegroundColor Red
    exit 1
}

# Copy contract artifacts
Write-Host "Copying contract artifacts..." -ForegroundColor Yellow
Copy-Item "build/contracts/TaskManager.json" "client/contracts/TaskManager.json" -Force
Write-Host "✓ Contract artifacts copied" -ForegroundColor Green

# Install client dependencies (if needed)
Write-Host "Checking client dependencies..." -ForegroundColor Yellow
Set-Location "client"
& npm install | Out-Null
Write-Host "✓ Client dependencies ready" -ForegroundColor Green

Write-Host ""
Write-Host "=== ENHANCED TASK MANAGER DAPP IS READY! ===" -ForegroundColor Green
Write-Host "• Blockchain: http://127.0.0.1:7545" -ForegroundColor White
Write-Host "• Client: http://localhost:3000" -ForegroundColor White
Write-Host "" 
Write-Host "✨ NEW FEATURES:" -ForegroundColor Cyan
Write-Host "• Task Categories and Organization" -ForegroundColor White
Write-Host "• Priority Levels (High, Medium, Low)" -ForegroundColor White
Write-Host "• Due Dates and Overdue Tracking" -ForegroundColor White
Write-Host "• Advanced Filtering and Search" -ForegroundColor White
Write-Host "• Task Editing Capabilities" -ForegroundColor White
Write-Host "• MetaMask Support for Testnet" -ForegroundColor White
Write-Host ""
Write-Host "Opening your Enhanced Task Manager DApp..." -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the client server" -ForegroundColor Yellow
Write-Host ""

# Start the client
& npm start