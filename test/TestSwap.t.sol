// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import "forge-std/Test.sol";
import "../src/Swap.sol";
import "../src/IV2Router.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract TestSwap is Test {

Swap public swap;
address constant ARBITRUM_ROUTER = 0x4752ba5DBc23f44D87826276BF6Fd6b1C372aD24;
address constant USDC = 0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8;
address constant USDT = 0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9;
address constant WHALE = 0x489ee077994B6658eAfA855C308275EAd8097C4A; // GMX Vault

function setUp() public {
    swap = new Swap(ARBITRUM_ROUTER);
}



    function testSwapUSDTtoUSDC() public {
vm.startPrank(WHALE);

        // Verificar que el WHALE tiene USDT
        uint256 initialUSDT = IERC20(USDT).balanceOf(WHALE);
        require(initialUSDT > 0, "Whale needs USDT");

        // Cantidad a swapear: 100 USDT (6 decimales)
        uint256 amountIn = 10 * 1e6;
        
        // Crear el path USDT -> USDC
        address[] memory path = new address[](2);
        path[0] = USDT;
        path[1] = USDC;

        // Aprobar al contrato para usar USDT
        IERC20(USDT).approve(address(swap), amountIn);

        // Hacer el swap con 0.5% de slippage
        swap.swapTokens(
            amountIn,                    // amount in
            amountIn * 95 / 1000,      // minimum amount out (0.5% slippage)
            path,                         // path de swap                       // to address
            block.timestamp + 15 minutes // deadline
        );

        // Verificar que recibimos USDC
        uint256 usdcReceived = IERC20(USDC).balanceOf(WHALE);
        assertGt(usdcReceived, 0, "Should have received USDC");

        vm.stopPrank();
    }

    function testSwapUSDCtoUSDT() public {
        vm.startPrank(WHALE);
        // Verificar que el WHALE tiene USDC
        uint256 initialUSDC = IERC20(USDC).balanceOf(WHALE);
        require(initialUSDC > 0, "Whale needs USDC");

        // Cantidad a swapear: 100 USDC (6 decimales)
        uint256 amountIn = 100 * 1e6;
        
        // Crear el path USDC -> USDT
        address[] memory path = new address[](2);
        path[0] = USDC;
        path[1] = USDT;

        // Aprobar al contrato para usar USDC
        IERC20(USDC).approve(address(swap), amountIn);

        // Hacer el swap con 0.5% de slippage
        swap.swapTokens(
            amountIn,                    // amount in
            amountIn * 95 / 1000,      // minimum amount out (0.5% slippage)
            path,                        // path de swap
            block.timestamp + 15 minutes // deadline
        );

        // Verificar que recibimos USDT
        uint256 usdtReceived = IERC20(USDT).balanceOf(WHALE);
        assertGt(usdtReceived, 0, "Should have received USDT");

        vm.stopPrank();
    }










}
