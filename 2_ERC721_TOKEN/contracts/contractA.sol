pragma solidity ^0.7.0;

import '@openzeppelin/contracts/token/ERC721/ERC721HOLDER.sol';
import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

interface ContractB {
    function deposite(uint amount) external;
    function withdraw(uint amount) external;
}

contract contractA is ERC721Holder{
    IERC721 public token;
    ContractB public contractB;

    constructor(address _tokenAddr,address contractBaddress) {
        token = IERC721(_tokenAddr);
        contractB = ContractB(contractBaddress);
    }

    /* NOTE: YOU NEED TO CALL APPROVE FROM TOKEN THEN DEPOSIE */

    function deposite(uint tokenId) external {
        token.safeTransferFrom(msg.sender,address(this),tokenId);
        token.approve(address(contractB),tokenId);
        contractB.deposite(tokenId);
    }

    function withdraw(uint tokenId) external{
        contractB.withdraw(tokenId);
        token.safeTransferFrom(address(this),msg.sender,tokenId);
    }
}