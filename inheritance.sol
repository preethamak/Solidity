// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ownable{
    address owner;

    constructor() {
        
          owner = msg.sender;
    }
}

contract inher is ownable{
    string secret;
   

    modifier onlyowner(){
        require(msg.sender == owner, 'only owner');
        _;
    }
    constructor(string memory _secret){
         secret = _secret;
        owner = msg.sender;
        super;
    }

    function getsecret() public view onlyowner returns(string memory){
        return secret;
    }
}