pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

interface ContractB{
    function deposite(uint amount) external;
    function withdraw(uint amount) external;
}

contract contractA {
    IERC20 public token;
    ContractB public contractB;

    constructor(address tokenAddress,address contractBAddr){
        token = IERC20(tokenAddress);
        contractB = ContractB(contractBAddr);
    }

    /* REMEMBER YOU NEED TO APPROVE THIS CONTRACT FROM TOKEN/UI*/
    function deposit(uint amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        token.approve(address(contractB), amount);
        contractB.deposite(amount);
    }

    function withdraw(uint amount) external {
        contractB.withdraw(amount);
        token.transfer(msg.sender, amount);
    }
}