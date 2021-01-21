pragma solidity ^0.7.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract WrappedEther is ERC20{
    constructor() ERC20('Wrapped Ether','WETH'){}

    function buyWETH() payable external{
        _mint(msg.sender, msg.value);
    }
    function sellWETH(uint amount) external {
        require(balanceOf(msg.sender) >= amount,'WETH: not enough Balance');
        _burn(msg.sender,amount);
        msg.sender.transfer(amount);
    }
}