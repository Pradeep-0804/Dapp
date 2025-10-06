# 🚀 Blockchain Task Manager DApp

A decentralized task management application built on Ethereum using Solidity smart contracts and Web3.js.

## ✨ Features

### Core Features
- **Decentralized Storage**: All tasks are stored on the blockchain
- **User Authentication**: Each wallet manages its own tasks
- **Task Management**: Create, edit, complete, and delete tasks
- **Real-time Updates**: Instant blockchain interaction
- **Modern UI**: Beautiful, responsive interface with enhanced UX
- **Statistics Dashboard**: Track total, completed, and pending tasks

### 🆕 Enhanced Features
- **🏷️ Task Categories**: Organize tasks with custom categories (Work, Personal, etc.)
- **⚡ Priority Levels**: High, Medium, Low priority with color-coded badges
- **📅 Due Dates**: Set deadlines with overdue task highlighting
- **🔍 Advanced Search**: Real-time search through task content
- **📋 Smart Filtering**: Filter by category, priority, status, and due dates
- **📄 Flexible Sorting**: Sort by date, priority, category, or due date
- **✏️ Task Editing**: Edit task content, category, priority, and due dates
- **🤖 MetaMask Integration**: Connect to testnets and mainnet
- **🌐 Testnet Ready**: Deploy to Sepolia or other testnets

## 🏗️ Architecture

- **Smart Contract**: `TaskManager.sol` - Solidity contract for task management
- **Frontend**: HTML/CSS/JavaScript with Web3.js integration
- **Blockchain**: Local Ethereum network via Ganache
- **Development Framework**: Truffle Suite

## 🚀 Quick Start

### Prerequisites

- Node.js (v14+ recommended)
- npm
- Truffle Suite
- Ganache CLI

### Running the DApp

1. **Easy Start (Recommended)**:
   ```powershell
   .\start-dapp.ps1
   ```
   This script will automatically:
   - Start Ganache blockchain
   - Deploy smart contracts
   - Copy contract artifacts
   - Start the client server

2. **Manual Start**:
   ```powershell
   # Start Ganache
   ganache --host 127.0.0.1 --port 7545 --deterministic --accounts 10 --defaultBalanceEther 1000

   # Deploy contracts
   truffle migrate --reset

   # Copy contract artifacts
   Copy-Item "build/contracts/TaskManager.json" "client/contracts/TaskManager.json"

   # Start client
   cd client
   npm install
   npm start
   ```

3. **Access the DApp**:
   - Open your browser to `http://localhost:3000`
   - The DApp will automatically connect to Ganache at `http://127.0.0.1:7545`

## 📱 How to Use

### Basic Usage
1. **Connect**: The DApp automatically connects to Ganache or MetaMask
2. **Add Tasks**: 
   - Enter task description
   - Select category (or create new one)
   - Choose priority level (Low/Medium/High)
   - Set due date (optional)
   - Click "Add Task"

### Task Management
3. **Organize Tasks**:
   - **Search**: Use the search bar to find specific tasks
   - **Filter**: Filter by category, priority, or status
   - **Sort**: Choose sorting method (date, priority, category)
4. **Edit Tasks**: Click the "Edit" button to modify task details
5. **Complete/Delete**: Use action buttons to manage task status
6. **View Statistics**: Monitor your productivity with the dashboard

### Advanced Features
7. **Categories**: Tasks are automatically organized by category
8. **Overdue Tracking**: Overdue tasks are highlighted in red
9. **Priority Management**: High-priority tasks are visually emphasized

## 🔧 Smart Contract Details

### TaskManager Contract

- **Address**: Deployed on local Ganache network
- **Functions**:
  - `createTask(string)` - Create a new task
  - `toggleCompleted(uint)` - Toggle task completion
  - `deleteTask(uint)` - Delete a task
  - `getTask(uint)` - Get task details
  - `getMyTasks()` - Get user's task IDs
  - `getTotalTasks()` - Get total task count

### Events

- `TaskCreated` - Emitted when a task is created
- `TaskCompleted` - Emitted when task status changes
- `TaskDeleted` - Emitted when a task is deleted

## 🛠️ Development

### Project Structure

```
dapp-demo/
├── contracts/          # Solidity smart contracts
│   ├── TaskManager.sol  # Main task management contract
│   └── Migrations.sol   # Migration contract
├── migrations/          # Deployment scripts
├── client/             # Frontend application
│   ├── src/            # JavaScript source files
│   ├── contracts/      # Contract artifacts
│   └── index.html      # Main HTML file
├── build/              # Compiled contract artifacts
└── start-dapp.ps1      # Quick start script
```

### Testing

```powershell
truffle test
```

### Compilation

```powershell
truffle compile
```

## 🔗 Network Configuration

- **Local Development**: Ganache on `http://127.0.0.1:7545`
- **Network ID**: 1337 (Ganache default)
- **Gas Limit**: 6,721,975
- **Gas Price**: 20,000,000,000 wei

## 💡 Features Implemented

### Core Functionality
- ✅ Task creation with blockchain storage
- ✅ Task completion toggling
- ✅ Task deletion and editing
- ✅ User-specific task management
- ✅ Real-time blockchain interaction
- ✅ Modern responsive UI
- ✅ Task statistics dashboard
- ✅ Error handling and status messages

### Enhanced Features
- ✅ **Task Categories**: Custom categorization system
- ✅ **Priority System**: High/Medium/Low with visual indicators
- ✅ **Due Date Management**: Deadline setting with overdue alerts
- ✅ **Advanced Search**: Real-time content search
- ✅ **Multi-Filter System**: Category, priority, status, and date filters
- ✅ **Smart Sorting**: Multiple sorting options
- ✅ **In-Place Editing**: Edit tasks without recreating
- ✅ **MetaMask Support**: Wallet connection for testnet/mainnet
- ✅ **Testnet Deployment**: Scripts and configs for Sepolia/Goerli

## 🌐 Testnet Deployment

### Prerequisites for Testnet
1. **Infura Account**: Get a project ID from [infura.io](https://infura.io)
2. **Test ETH**: Get Sepolia ETH from faucets:
   - [Sepolia Faucet](https://sepoliafaucet.com/)
   - [Alchemy Sepolia Faucet](https://sepoliafaucet.com/)
3. **MetaMask**: Install and set up with test account

### Deployment Steps
1. **Configure Environment**:
   ```powershell
   # Copy environment template
   Copy-Item .env.example .env
   
   # Edit .env with your values:
   # MNEMONIC="your twelve word mnemonic phrase"
   # INFURA_PROJECT_ID="your_infura_project_id"
   ```

2. **Deploy to Testnet**:
   ```powershell
   # Install dependencies
   npm install @truffle/hdwallet-provider dotenv
   
   # Deploy to Sepolia
   .\deploy-testnet.ps1 -Network sepolia
   ```

3. **Update Frontend**:
   - Your DApp will automatically detect MetaMask
   - Switch MetaMask to Sepolia network
   - The contract will be available at the deployed address

## 🎯 Future Enhancements

- [ ] Task sharing between users
- [ ] Task templates and recurring tasks
- [ ] IPFS integration for file attachments
- [ ] Push notifications for due dates
- [ ] Team collaboration features
- [ ] Data export/import functionality
- [ ] Mobile-responsive PWA version
- [ ] Integration with calendar apps

## 🐛 Troubleshooting

### Common Issues

1. **"Cannot connect to blockchain"**
   - Ensure Ganache is running on port 7545
   - Check if the network configuration matches

2. **"Contract not deployed"**
   - Run `truffle migrate --reset`
   - Ensure contract artifacts are copied to client/contracts/

3. **Transaction failures**
   - Check if you have sufficient ETH in your account
   - Verify gas limits in the contract calls

### Getting Help

If you encounter issues:
1. Check the browser console for errors
2. Verify Ganache is running with: `netstat -an | Select-String 7545`
3. Ensure all dependencies are installed

## 📄 License

MIT License - Feel free to use and modify as needed.

---

**Congratulations!** 🎉 You've successfully converted your Greet DApp into a fully functional Task Manager DApp!

# Blockchain DApp Demo

This is a decentralized application (DApp) built with Truffle and Web3.js that demonstrates blockchain interaction through a simple greeting contract.

## Project Structure

```
dapp-demo/
├── contracts/
│   ├── Greeting.sol          # Main smart contract
│   └── Migrations.sol        # Truffle migrations contract
├── migrations/
│   ├── 1_initial_migration.js
│   └── 2_greeting_migration.js
├── client/
│   ├── contracts/
│   │   └── Greeting.json     # Contract ABI and artifact
│   ├── src/
│   │   ├── utils.js          # Web3 utility functions
│   │   └── index.js          # Main application logic
│   ├── index.html            # Frontend interface
│   └── package.json
├── truffle-config.js         # Truffle configuration
└── package.json
```

## Prerequisites

1. **Node.js** (v12 or higher)
2. **Truffle** - Ethereum development framework
3. **Ganache** - Local blockchain for development
4. **Web Browser** with MetaMask extension (optional)

## Installation & Setup

### Step 1: Install Dependencies

```bash
# Install Truffle globally
npm install -g truffle

# Install Ganache CLI globally
npm install -g ganache-cli

# Or download Ganache GUI from https://trufflesuite.com/ganache/
```

### Step 2: Start Local Blockchain

#### Option A: Using Ganache GUI
1. Download and install Ganache from https://trufflesuite.com/ganache/
2. Create a new workspace (Ethereum)
3. Configure the server to run on `127.0.0.1:7545`

#### Option B: Using Ganache CLI
```bash
ganache-cli -p 7545
```

### Step 3: Compile and Deploy Smart Contracts

```bash
# Navigate to project root
cd dapp-demo

# Compile contracts
truffle compile

# Deploy to local network
truffle migrate --network development

# Or reset if redeploying
truffle migrate --reset --network development
```

### Step 4: Update Contract Address

After deployment, you'll see the contract address in the console. Update the `client/contracts/Greeting.json` file with the correct address in the networks section.

### Step 5: Start Frontend

```bash
# Navigate to client directory
cd client

# Install dependencies
npm install

# Start the development server
npm start
```

The application will be available at `http://localhost:3000`

## Usage

1. **View Current Greeting**: The current greeting is displayed on the page
2. **Update Greeting**: Enter a new greeting message and click "Submit"
3. **Refresh Greeting**: Click "Get Current Greeting" to refresh the display

## Smart Contract Functions

### `sayHello()`
- **Type**: View function
- **Returns**: Current greeting string
- **Gas**: No gas required (read-only)

### `updateGreeting(string _greeting)`
- **Type**: Transaction function
- **Parameters**: New greeting string
- **Gas**: ~3,000,000 wei

### `greeting`
- **Type**: Public variable
- **Returns**: Current greeting string
- **Gas**: No gas required (read-only)

## Troubleshooting

### Common Issues

1. **"Contract not deployed" error**
   - Make sure Ganache is running on port 7545
   - Run `truffle migrate --reset` to redeploy contracts
   - Check that the contract address in `Greeting.json` matches the deployed address

2. **"Web3 connection failed" error**
   - Ensure Ganache is running on `127.0.0.1:7545`
   - Check browser console for detailed error messages

3. **Transaction failures**
   - Ensure you have enough ETH in your account
   - Check gas limit settings
   - Verify network ID matches Ganache

### Network Configuration

The application is configured to connect to:
- **Host**: 127.0.0.1 (localhost)
- **Port**: 7545
- **Network ID**: Any (*)

## Development Notes

- The smart contract is written in Solidity ^0.8.19
- Frontend uses vanilla JavaScript with Web3.js
- jQuery is included for DOM manipulation
- Contract artifacts are stored in `client/contracts/`

## Testing with MetaMask

1. Install MetaMask browser extension
2. Add custom network:
   - Network Name: Ganache Local
   - RPC URL: http://127.0.0.1:7545
   - Chain ID: 1337 (or as shown in Ganache)
   - Currency Symbol: ETH
3. Import account using private key from Ganache
4. The DApp should automatically detect MetaMask

## License

This project is for educational purposes and is provided as-is.