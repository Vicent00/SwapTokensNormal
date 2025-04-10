# Swap Tokens on Arbitrum 🚀

Este proyecto implementa un contrato inteligente para realizar swaps de tokens en la red Arbitrum utilizando Uniswap V2. El contrato permite intercambiar tokens ERC20 de manera segura y eficiente, con control sobre el slippage y deadlines.

## ✨ Características Principales

### 🎯 Funcionalidades Core
- 💱 Swap exacto de tokens por tokens
- 🔗 Integración directa con Uniswap V2 Router
- 📊 Manejo configurable de slippage
- ⏱️ Sistema de deadlines para transacciones
- ✅ Validación de balances y aprobaciones
- 🔒 Manejo seguro de tokens ERC20

### 🛡️ Seguridad
- 🛡️ Uso de SafeERC20 para transferencias seguras
- 🔍 Validación de balances antes de las operaciones
- ⚠️ Manejo de errores y revertidos
- 🔐 Protección contra reentrancy
- ✅ Validación de direcciones y cantidades

### 🧪 Testing
- 🧪 Tests completos con Foundry
- 🔄 Tests de integración con la red Arbitrum
- 💰 Verificación de balances y transferencias
- 🎯 Tests de casos límite y errores

## 🛠️ Tecnologías Utilizadas

### ⛓️ Blockchain
- 📜 Solidity 0.8.26
- 🌐 Arbitrum Network
- 🔄 Uniswap V2 Protocol

### 💻 Desarrollo
- 🔨 Foundry para testing y deployment
- 🏗️ OpenZeppelin Contracts
- ⚙️ Hardhat (opcional para desarrollo local)

### 🧰 Herramientas
- 🔍 Slither para análisis de seguridad
- 📝 Solhint para linting
- 📚 Git para control de versiones

## 📦 Instalación

### 📋 Prerrequisitos
- 📦 Node.js (v16 o superior)
- 🔨 Foundry
- 📚 Git

### 📝 Pasos de Instalación

1. Clona el repositorio:
```bash
git clone (https://github.com/Vicent00/SwapTokensNormal.git)
cd swapTokensNormal
```

2. Instala las dependencias:
```bash
forge install
```

3. Configura tu entorno:
```bash
cp .env.example .env
# Edita .env con tus configuraciones
```


## 🔧 Configuración

### Variables de Entorno
```env
ARBITRUM_RPC_URL=https://arb1.arbitrum.io/rpc
PRIVATE_KEY=tu_llave_privada
ETHERSCAN_API_KEY=tu_api_key
```

### Configuración de Red
- Mainnet: Arbitrum One
- Testnet: Arbitrum Goerli
- RPC URL: https://arb1.arbitrum.io/rpc

## 💻 Uso

### Despliegue

1. Configura tu `.env`:
```bash
cp .env.example .env
# Edita .env con tus configuraciones
```

2. Despliega el contrato:
```bash
forge create --rpc-url $ARBITRUM_RPC_URL \
  --constructor-args 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506 \
  src/Swap.sol:Swap
```

### Testing

Para ejecutar los tests:
```bash
# Tests básicos
forge test

# Tests con fork de Arbitrum
forge test --fork-url $ARBITRUM_RPC_URL -vv

# Tests con coverage
forge coverage
```

## 📍 Direcciones Importantes

### Contratos
- Router V2 de Uniswap: `0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506`
- USDC: `0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8`
- USDT: `0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9`
- DAI: `0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1`

### Pools de Liquidez
- USDC/USDT: `0x2f5e87C9312fa29aed5c179E456625D79015299c`
- USDC/DAI: `0x7f90122BF0700F9E7e1F688fe926940E8839F353`

## 🔍 Funcionalidades Detalladas

### Swap de Tokens
```solidity
function swapTokens(
    uint amountIn,
    uint amountOutMin,
    address[] calldata path,
    address to,
    uint deadline
) external
```

### Parámetros
- `amountIn`: Cantidad exacta de tokens a enviar
- `amountOutMin`: Cantidad mínima de tokens a recibir
- `path`: Array de direcciones que define la ruta del swap
- `to`: Dirección que recibirá los tokens
- `deadline`: Tiempo límite para ejecutar la transacción

### Ejemplo de Uso
```solidity
// Swap de USDT a USDC
address[] memory path = new address[](2);
path[0] = USDT;
path[1] = USDC;

swap.swapTokens(
    100 * 1e6,                    // 100 USDT
    99 * 1e6,                     // 99 USDC mínimo
    path,
    msg.sender,
    block.timestamp + 15 minutes
);
```

## 🛡️ Seguridad

### Consideraciones de Seguridad
1. Validación de balances antes de operaciones
2. Uso de SafeERC20 para transferencias
3. Protección contra reentrancy
4. Validación de direcciones y cantidades
5. Manejo de errores y revertidos

### Auditorías
- [Enlace a auditorías realizadas]
- [Resultados de análisis de seguridad]

### 🧪 Testing

Para ejecutar los tests:
```bash
# 🧪 Tests básicos
forge test

# 🔄 Tests con fork de Arbitrum
forge test --fork-url $ARBITRUM_RPC_URL -vv

# 📊 Tests con coverage
forge coverage
```

## 📍 Direcciones Importantes

### 📑 Contratos
- 🔄 Router V2 de Uniswap: `0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506`
- �� USDC: `0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8`
- 💵 USDT: `0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9`
- 💵 DAI: `0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1`

### 💧 Pools de Liquidez
- 💵 USDC/USDT: `0x2f5e87C9312fa29aed5c179E456625D79015299c`
- 💵 USDC/DAI: `0x7f90122BF0700F9E7e1F688fe926940E8839F353`

## 🔍 Funcionalidades Detalladas

### 💱 Swap de Tokens
```solidity
function swapTokens(
    uint amountIn,
    uint amountOutMin,
    address[] calldata path,
    address to,
    uint deadline
) external
```

### 📊 Parámetros
- 💰 `amountIn`: Cantidad exacta de tokens a enviar
- 📉 `amountOutMin`: Cantidad mínima de tokens a recibir
- 🛣️ `path`: Array de direcciones que define la ruta del swap
- 📬 `to`: Dirección que recibirá los tokens
- ⏱️ `deadline`: Tiempo límite para ejecutar la transacción

### 📝 Ejemplo de Uso
```solidity
// Swap de USDT a USDC
address[] memory path = new address[](2);
path[0] = USDT;
path[1] = USDC;

swap.swapTokens(
    100 * 1e6,                    // 100 USDT
    99 * 1e6,                     // 99 USDC mínimo
    path,
    msg.sender,
    block.timestamp + 15 minutes
);
```

## 🛡️ Seguridad

### 🔒 Consideraciones de Seguridad
1. 🔍 Validación de balances antes de operaciones
2. 🛡️ Uso de SafeERC20 para transferencias
3. 🔐 Protección contra reentrancy
4. ✅ Validación de direcciones y cantidades
5. ⚠️ Manejo de errores y revertidos

### 📋 Auditorías
- 📝 [Enlace a auditorías realizadas]
- 🔍 [Resultados de análisis de seguridad]

## 🧪 Testing

### 📋 Tipos de Tests
1. 🧪 Unit Tests
   - 📝 Funcionalidades básicas
   - 🎯 Casos límite
   - ⚠️ Manejo de errores

2. 🔄 Integration Tests
   - 🔗 Interacción con Uniswap
   - 💰 Manejo de tokens
   - ✅ Validación de balances

3. 🌐 Fork Tests
   - 🔄 Tests en la red real
   - 💹 Verificación de precios
   - 💧 Validación de pools

### 🚀 Ejecución de Tests
```bash
# 🧪 Todos los tests
forge test

# �� Tests específicos
forge test --match-test testSwapUSDTtoUSDC

# 🔄 Tests con fork
forge test --fork-url $ARBITRUM_RPC_URL
```

## 🤝 Contribuir

1. 📥 Fork el proyecto
2. 🌿 Crea tu rama de feature (`git checkout -b feature/AmazingFeature`)
3. 💾 Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push a la rama (`git push origin feature/AmazingFeature`)
5. 🔄 Abre un Pull Request

### 📋 Guía de Contribución
- 📝 Sigue las convenciones de código
- 🧪 Añade tests para nuevas funcionalidades
- 📚 Documenta los cambios
- 📊 Mantén el coverage alto

## 📞 Contacto

- Email: [mailto:info@vicenteaguilar.com]
- 
## 🙏 Agradecimientos

- Equipo de Uniswap
- Comunidad de Arbitrum
- Contribuidores de OpenZeppelin
