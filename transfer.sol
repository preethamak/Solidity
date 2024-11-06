// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract money{
    address owner;
    uint cost;

    constructor() payable {
        owner = msg.sender;
        cost = 5 ether;
    }

    modifier onlyowner{
        require(msg.sender == owner, "you are not a owner ");
        _;
    }
    

    function send(address payable person, uint _amount ) public onlyowner{
       
      
       person.transfer(_amount);
    }

   receive() external payable {
   
     
    }

}