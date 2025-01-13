// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Mycontract{
    //state variables
    uint public myint = 1;
    string public mystr = "hello world!";

    //creating own structure
    struct MyStruct{
        uint number;
        string name;
    }

    //calling the function 
      MyStruct public myStruct =  MyStruct(10, "ajay");

    //local variable
    function getval() public pure  returns(uint){
        uint value = 1;
        return value;

    }
}
