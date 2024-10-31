// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract even{
    //conditionals
    //loops
    address public owner;

    constructor() {
        owner = msg.sender;
    }
   
    function getcount() public view returns(uint){
        uint count = 0;
        for (uint i = 0; i<number.length; i++){
            if(Numbereven(number[i])){
                count++;
            }
        }
        return count;
    }
    uint[] public number = [1,2,3,4,5,6,7,8,9,10];
   function Numbereven(uint _number) public pure returns(bool){
      if(_number % 2 == 0){
        return true;
      }   
      else{
        return false;
      }
      }

      function isOwner() public view returns(bool){
        if(msg.sender == owner){
            return true;
        }
        else{
            return false;
        }
      }
}