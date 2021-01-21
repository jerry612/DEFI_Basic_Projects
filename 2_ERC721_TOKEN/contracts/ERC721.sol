pragma solidity ^0.7.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract token is ERC721{
    constructor() ERC721('Shahzain Tariq', 'STS'){
        _safeMint(msg.sender, 0);
    }
}

contract token1 is ERC721{
    address admin;
    constructor() ERC721('Shahzain Tariq','STS'){
        admin = msg.sender;
    }

    function mint(address to,uint tokenId) public {
        require(admin == msg.sender,'ERROR: only admin');
        _safeMint(to, tokenId);
    }
}