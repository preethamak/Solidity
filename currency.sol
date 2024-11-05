// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract coin{
    address public minter;
    mapping(address => uint ) public balance;

    
    event sent(address from, address to, uint amount);
    //contructor only runs when we deploy the cntract to the blockchain
    constructor(){
        minter = msg.sender;
    }

    //only owner can access this function
    //to create coin and send to the given address
    function mint(address reciver, uint amount) public {
        require(msg.sender == minter , "you are not a minter");
        balance[reciver]+= amount;
    }

    error insufficentbalance(uint requested, uint available);

    //to send the money or the coins to any account
    function send(address reciver, uint amount) public{

        if(balance[msg.sender]>=amount){
        balance[msg.sender] -=amount;
        balance[reciver] += amount;
        }
        else{
            revert insufficentbalance(amount ,balance[msg.sender]);
        }
        emit sent(msg.sender, reciver, amount);
    }
}