pragma solidity ^0.7.1;

interface IOracle{
    function getData(bytes32 _key) external view returns(bool result,uint date,uint paylad);
}