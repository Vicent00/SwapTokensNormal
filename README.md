# Swap Tokens on Arbitrum

This project implements a smart contract to perform token swaps on the Arbitrum network using Uniswap V2. The contract allows secure and efficient ERC20 token exchanges, with control over slippage and deadlines.

## 🚀 Main Features

### Core Functionalities
- Exact token-to-token swaps
- Direct integration with Uniswap V2 Router
- Configurable slippage handling
- Transaction deadline system
- Validation of balances and approvals
- Secure handling of ERC20 tokens

### Security
- Use of SafeERC20 for secure transfers
- Validation of balances before operations
- Error handling and reverts
- Protection against reentrancy
- Validation of addresses and amounts

### Testing
- Comprehensive tests with Foundry
- Integration tests with the Arbitrum network
- Verification of balances and transfers
- Edge case and error tests

## 🛠️ Technologies Used

### Blockchain
- Solidity 0.8.26
- Arbitrum Network
- Uniswap V2 Protocol

### Development
- Foundry for testing and deployment
- OpenZeppelin Contracts
- Hardhat (optional for local development)

### Tools
- Slither for security analysis
- Solhint for linting
- Git for version control

## 📦 Installation

### Prerequisites
- Node.js (v16 or higher)
- Foundry
- Git

### Installation Steps

1. Clone the repository:
```bash
git clone [your-repository]
cd swapTokensNormal
```

2. Install dependencies:
```bash
forge install
```

3. Configure your environment:
```bash
cp .env.example .env
# Edit .env with your configurations
```

## 🏗️ Project Structure

swapTokensNormal/
├── src/
│ ├── Swap.sol # Main swap contract
│ ├── IV2Router.sol # Uniswap V2 Router interface
│ └── interfaces/ # Additional interfaces
├── test/
│ ├── TestSwap.t.sol # Tests for the Swap contract
│ └── mocks/ # Mocks for testing
├── script/
│ └── deploy.s.sol # Deployment scripts
└── lib/
└── openzeppelin/ # OpenZeppelin dependencies

## 🔧 Configuration

### Environment Variables
```env
ARBITRUM_RPC_URL=https://arb1.arbitrum.io/rpc
PRIVATE_KEY=your_private_key
ETHERSCAN_API_KEY=your_api_key
```

### Network Configuration
- Mainnet: Arbitrum One
- Testnet: Arbitrum Goerli
- RPC URL: https://arb1.arbitrum.io/rpc

## 💻 Usage

### Deployment

1. Configure your `.env`:
```bash
cp .env.example .env
# Edit .env with your configurations
```

2. Deploy the contract:
```bash
forge create --rpc-url $ARBITRUM_RPC_URL \
  --constructor-args 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506 \
  src/Swap.sol:Swap
```

### Testing

To run the tests:
```bash
# Basic tests
forge test

# Tests with Arbitrum fork
forge test --fork-url $ARBITRUM_RPC_URL -vv

# Tests with coverage
forge coverage
```

## 📍 Important Addresses

### Contracts
- Uniswap V2 Router: `0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506`
- USDC: `0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8`
- USDT: `0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9`
- DAI: `0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1`

### Liquidity Pools
- USDC/USDT: `0x2f5e87C9312fa29aed5c179E456625D79015299c`
- USDC/DAI: `0x7f90122BF0700F9E7e1F688fe926940E8839F353`

## 🔍 Detailed Functionalities

### Token Swap
```solidity
function swapTokens(
    uint amountIn,
    uint amountOutMin,
    address[] calldata path,
    address to,
    uint deadline
) external
```

### Parameters
- `amountIn`: Exact amount of tokens to send
- `amountOutMin`: Minimum amount of tokens to receive
- `path`: Array of addresses defining the swap route
- `to`: Address to receive the tokens
- `deadline`: Time limit to execute the transaction

### Usage Example
```solidity
// Swap USDT to USDC
address[] memory path = new address[](2);
path[0] = USDT;
path[1] = USDC;

swap.swapTokens(
    100 * 1e6,                    // 100 USDT
    99 * 1e6,                     // Minimum 99 USDC
    path,
    msg.sender,
    block.timestamp + 15 minutes
);
```

## 🛡️ Security

### Security Considerations
1. Validation of balances before operations
2. Use of SafeERC20 for transfers
3. Protection against reentrancy
4. Validation of addresses and amounts
5. Error handling and reverts

### Audits
- [Link to performed audits]
- [Security analysis results]

## 🧪 Testing

### Types of Tests
1. Unit Tests
   - Basic functionalities
   - Edge cases
   - Error handling

2. Integration Tests
   - Interaction with Uniswap
   - Token handling
   - Balance validation

3. Fork Tests
   - Tests on the real network
   - Price verification
   - Pool validation

### Running Tests
```bash
# All tests
forge test

# Specific tests and examples
forge test --match-test testSwapUSDTtoUSDC

# Fork tests
forge test --fork-url $ARBITRUM_RPC_URL
```

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Guidelines
- Follow code conventions
- Add tests for new features
- Document changes
- Maintain high coverage

## 📝 License

This project is licensed under the MIT License.

## 📞 Contact

- Email: [mailto:info@vicenteaguilar.com]


## 🙏 Acknowledgments

- Uniswap Team
- Arbitrum Community
- OpenZeppelin Contributors
