// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ballot{
    struct voter{
        uint weight;
        bool voted;
        uint vote;
        address delegate;
    }

    struct proposal {
       bytes32 name;
       uint votecount;
   }
   
   mapping(address => voter) public voters;
    address public chairPerson;
   // Now this is an array of proposals, so it has a dynamic size
   mapping(bytes32 => proposal) public proposals;

   constructor(bytes32[] memory proposalnames){
      chairPerson = msg.sender;
      voters[chairPerson].weight = 1;

       for(uint i=0; i < proposalnames.length ;i++){
           // Now this is how you push to the array.
          proposals[proposalnames[i]].name = proposalnames[i];
          proposals[proposalnames[i]].votecount = 0;
      }
   }

}