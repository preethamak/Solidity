// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract fallbackex{
    uint public result;
    receive() external payable { result = 1;}
// receive fxn gets trigered when ever we transact etherum. even it is 0 also

    fallback() external payable { 
        result = 2;
    }
    /* here if the call data is not understood to the complier. it directs to fallback and if you 
    try to send some etherum it forwards to receive fxn.
    is msg.data empty?
         /     \
        yes    no
        /        \
       receive()  fallback()
       /     \
       yes   no
       /       \
    receive()  fallback()
    */
}