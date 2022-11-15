// SPDX License-Identifier : MIT

pragma solidity ^0.8.7;


contract ModifierTest {

    address ContractOwner;
    mapping (address => bool) user;

    constructor () {
        ContractOwner = msg.sender; 
    }

    modifier onlyOwner() {
        require(msg.sender == ContractOwner, "You are not the owner!");
        _;
    }


    function newOwner (address newAddress) public onlyOwner {
        ContractOwner = newAddress;
    }

    function getAddress ()public view returns (address){
        return ContractOwner;
    }

    function addUser (address newuser) public onlyOwner{
        

        if (user[newuser] == true) {
            revert();
        } else {
            user[newuser] = true;
        }

        
    }

    function deleteUser (address olduser) public onlyOwner{
        

        if (user[olduser] == false) {
            revert();
        } else {
            user[olduser] = false;
        }

        
    }
}