pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract CollateralBackedToken is ERC20{
    IERC20 public collateral;
    uint price = 1;

    constructor(address collateralAddress) ERC20('Collateral Backed Token','CBT'){
        collateral = IERC20(collateralAddress);
    }

    /* CALL APPROVE FUNCTION TO APPROVE THIS CONTRACT TO USE YOUR TOKEN */
    function deposit(uint collateralAmount) external {
        collateral.transferFrom(msg.sender, address(this), collateralAmount);
        _mint(msg.sender, collateralAmount*price);
    }

    function withdraw(uint amount) external{
        require(balanceOf(msg.sender) >= amount,'ERROR: not enough balance');
        _burn(msg.sender,amount);
        collateral.transfer(msg.sender,amount/price);
    }
}