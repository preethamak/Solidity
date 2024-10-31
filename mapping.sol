// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract map{
    //mapping
    mapping (uint => string) public cricket;
    mapping(uint => book) public books;

    //nested mappings
    mapping(address => mapping(uint => book)) public newMap;

    struct book{
        string title;
        string author;
    }

    constructor(){
        cricket[1] = "smith";
        cricket[2] = "root";
        cricket[3] = "williamson";
        cricket[4] = "kohli";
    }

    function addBook(uint _id, string memory _title, string memory _author) public{
        books[_id] = book(_title, _author);
    }

    //function for nested mapping
    function addBook2(uint _id, string memory _title, string memory _author) public{
        newMap[msg.sender][_id] = book(_title, _author);
    }
}