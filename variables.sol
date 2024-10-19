// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContracts {
    // STATE VARIABLES
    uint public MYvar = 1; // it can be accessed in overall function
    uint256 public var256 = 1; // it also stores the value but has larger size

    // strings
    string public str = "hello world";
    bytes32 public bt = "hello world"; // Needs to be bytes32 type

    // storing address
    address public Myaddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // struct
    struct Mystruct {
        uint256 Myuint256;
        string str;
    }

    Mystruct public myStruct = Mystruct(1, "hello world");

    // LOCAL VARIABLES
    function getvalue() public pure returns (uint) {
        uint value = 1; // it can be accessed only in this given function
        return value;
    }
}
