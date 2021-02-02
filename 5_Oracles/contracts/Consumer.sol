pragma solidity ^0.7.1;

import './IOracles.sol';

contract Consumer{
    IOracle public oracle;

    constructor(address oracleAddr) {
        oracle = IOracle(oracleAddr);
    }

    function foo() external{
        bytes32 key = keccak256(abi.encodePacked('BTC/USD'));

        (bool result,uint timestamp,uint data) = oracle.getData(key);
        require(result,'ERROR:could not get the price');
        require(block.timestamp >= block.timestamp - 2 minutes,'ERROR: price too old');
        // do you anything price 
    }
}