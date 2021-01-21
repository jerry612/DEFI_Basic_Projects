pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract token1 is ERC20{
    constructor() ERC20('shahzain tariq','STS'){
        _mint(msg.sender,100000*10**18);
    }
}

contract token2 is ERC20{
    address admin;
    constructor() ERC20('shahzain tariq','STS'){
        admin = msg.sender;
    }

    function mint(address recipient,uint256 _amount) external {
        require(admin == msg.sender, 'ERROR: only admin');
        _mint(recipient,_amount);
    }
}