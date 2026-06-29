// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract USDT is ERC20{
    constructor(string memory name, string memory symbol) ERC20(name, symbol){

    }

    function mint(uint256 _amount)public {
        _mint(address(this), _amount);
    }
}
