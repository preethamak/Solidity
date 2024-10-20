
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mycon{
    uint[] public arr = [2, 4, 6, 8];
    string[] public str = ["smith", "root", "williamson"];
    string[] public value;
    //2D array
    uint[][] public Darr = [[2, 4 ,6], [1, 3, 5]];

    function pushVal(string memory _value) public{
        value.push(_value);
    }
    function count() public view returns(uint){
        return value.length;
    }
    }
