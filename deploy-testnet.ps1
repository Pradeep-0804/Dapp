# Testnet Deployment Script for Task Manager DApp
param(
    [Parameter(Mandatory=$false)]
    [string]$Network = "sepolia"
)

Write-Host "=== DEPLOYING TO TESTNET ===" -ForegroundColor Cyan
Write-Host "Target Network: $Network" -ForegroundColor Yellow
Write-Host ""

# Check if .env file exists
if (-not (Test-Path ".env")) {
    Write-Host "❌ Error: .env file not found!" -ForegroundColor Red
    Write-Host "Please copy .env.example to .env and fill in your values:" -ForegroundColor Yellow
    Write-Host "1. Your 12-word mnemonic phrase" -ForegroundColor Yellow
    Write-Host "2. Your Infura Project ID" -ForegroundColor Yellow
    Write-Host "3. (Optional) Your Etherscan API key" -ForegroundColor Yellow
    exit 1
}

# Install dependencies if needed
Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow
if (-not (Test-Path "node_modules/@truffle/hdwallet-provider")) {
    npm install @truffle/hdwallet-provider dotenv
}
if (-not (Test-Path "node_modules/dotenv")) {
    npm install dotenv
}

# Compile contracts
Write-Host "🔨 Compiling contracts..." -ForegroundColor Yellow
$compileResult = & truffle compile 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Compilation failed!" -ForegroundColor Red
    Write-Host $compileResult -ForegroundColor Red
    exit 1
}
Write-Host "✅ Contracts compiled successfully" -ForegroundColor Green

# Deploy to testnet
Write-Host "🚀 Deploying to $Network testnet..." -ForegroundColor Yellow
Write-Host "⚠️  This will cost real ETH (testnet)!" -ForegroundColor Yellow
$confirmation = Read-Host "Continue? (y/N)"
if ($confirmation -ne "y" -and $confirmation -ne "Y") {
    Write-Host "Deployment cancelled." -ForegroundColor Yellow
    exit 0
}

$deployResult = & truffle migrate --network $Network 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Deployment failed!" -ForegroundColor Red
    Write-Host $deployResult -ForegroundColor Red
    exit 1
}

Write-Host "✅ Deployment successful!" -ForegroundColor Green
Write-Host ""

# Extract contract address from deployment result
$contractAddress = $deployResult | Select-String "contract address:\s+(0x[a-fA-F0-9]{40})" | ForEach-Object { $_.Matches[0].Groups[1].Value }
if ($contractAddress) {
    Write-Host "📋 Contract Address: $contractAddress" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "🔍 View on Etherscan:" -ForegroundColor Yellow
    if ($Network -eq "sepolia") {
        Write-Host "https://sepolia.etherscan.io/address/$contractAddress" -ForegroundColor Blue
    } elseif ($Network -eq "goerli") {
        Write-Host "https://goerli.etherscan.io/address/$contractAddress" -ForegroundColor Blue
    }
}

Write-Host ""
Write-Host "📝 Next steps:" -ForegroundColor Yellow
Write-Host "1. Update your frontend to connect to the testnet" -ForegroundColor White
Write-Host "2. Get testnet ETH from faucets if needed" -ForegroundColor White
Write-Host "3. Test your DApp with MetaMask on the testnet" -ForegroundColor White
Write-Host ""
Write-Host "🎉 Testnet deployment complete!" -ForegroundColor Green