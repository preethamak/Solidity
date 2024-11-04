// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract place{           // declaring the variables
    uint fortune;
    address owner;
    bool deseased;

    constructor()  payable { //payable is function. automatically payable
        owner = msg.sender;     //this is going to store the address that is called
        fortune = msg.value;    //msg.value stands for how much ether is transfered
        deseased = false;
    }

    //create a modifier so that only owner can access
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    //create a modifier so that transction is only possible when deseased = true
    modifier isdeseased(){
        require(deseased == true);
        _;
    }

    //creating array to store family members
    address payable [] familywallet;

    //mapping
    mapping (address => uint) inheritance;

    //creating funx for setting inheritance for each address
    function setinheritance(address payable wallet, uint amount) public onlyOwner{
        //adding wallet to family wallet (.push)
        familywallet.push(wallet);
        inheritance[wallet] = amount;
    }

    //pay family member according wallet address
    function payout() private isdeseased{
        for(uint i =0; i<familywallet.length; i++){
            familywallet[i].transfer(inheritance[familywallet[i]]);
            //transfering money from owner address to familymembers
        }
    }

    //to start to execute the program when deseased = true
    //oracle switch simulation
   function hasdeseased() public onlyOwner{
    deseased = true;
    payout();
   }
}