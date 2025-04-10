// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;


import "./IV2Router.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol";


contract Swap {

    using SafeERC20 for IERC20;

    address public V2Routeraddress;


constructor(address _V2Routeraddress) {
    V2Routeraddress = _V2Routeraddress;
}


    function swapTokens(uint amountIn_, uint amountOutMin_, address[] calldata path_,  uint deadline_) external {
 
        // Transfer the tokens from the sender to this contract
 IERC20(path_[0]).safeTransferFrom(msg.sender, address(this), amountIn_);

 // Approve the router to spend the tokens
    IERC20(path_[0]).approve(V2Routeraddress, amountIn_);

  uint[] memory amounts = IV2Router(V2Routeraddress).swapExactTokensForTokens(amountIn_, amountOutMin_, path_, msg.sender, deadline_);

    // Transfer the tokens to the sender
    IERC20(path_[path_.length - 1]).safeTransfer(msg.sender, amounts[amounts.length - 1]);


  }









}
