pragma solidity ^0.7.1;

contract Oracle{
    struct Data{
        uint date;
        uint payload;
    }

    mapping(address => bool) public reporters;
    mapping(bytes32 => Data) public data;
    address admin;

    constructor()  {
        admin = msg.sender;
    }

    function updateReporter(address reporter,bool isReporter) external{
        require(msg.sender == admin,"ERROR: only admin");
        reporters[reporter] = isReporter;
    }

    function updateData(bytes32 _key,uint _payload) external{
        require(reporters[msg.sender],"ERROR: you are not authorized");
        data[_key] = Data(block.timestamp,_payload);
    }

    function getData(bytes32 _key) external view returns(bool result,uint date,uint paylad){
        if(data[_key].date == 0 ){
            return (false,0,0);
        }

        return (true,data[_key].date,data[_key].payload);

    }

}