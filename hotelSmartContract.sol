// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract hotel{

    //cheacking for the vacancies
    enum status {vacant, occupied }
    status currentstatus;

    //events
    event occupy(address _occupant, uint value);

    //creating the address
    address payable public owner;

   constructor() {
    owner = payable(msg.sender);
    currentstatus = status.vacant;
   }
    
//modifiers
    modifier onlyVacant{
        //cheacking for the vacancy
        require(currentstatus == status.vacant, "currently occupied! ");
        _;
    }

    modifier cost{
        //cheacking for the cost
        require(msg.value >= 2, "ether not enough ");
        _;
    }
   //sending the cost to the address
   receive()external payable onlyVacant cost {
    
    currentstatus = status.occupied;
    owner.transfer(msg.value);

    //displaying the live occupants
    emit occupy(msg.sender, msg.value);
   }
}