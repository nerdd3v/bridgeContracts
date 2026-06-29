//SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {USDT} from "./USDT.sol";

contract Bridge{
    uint256 public amountHolded;
    address public tokenAddress;
    mapping(address user => uint256 amountPerUser) userHoldings;

    constructor(address _tokenAddress){
        tokenAddress = _tokenAddress;
    }

    function deposit(uint256 _amount, address _tokenAddress)public {
        require(_tokenAddress == tokenAddress);
        require(USDT(_tokenAddress).allowance(msg.sender, address(this)) >= _amount);
        require(USDT(_tokenAddress).transferFrom(msg.sender, address(this), _amount));
        userHoldings[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount, address _tokenAddress)public{
        require(_tokenAddress == tokenAddress);
        require(_amount <= userHoldings[msg.sender]);
        userHoldings[msg.sender] -= _amount;
        USDT(_tokenAddress).transfer(msg.sender, _amount);
    }
}