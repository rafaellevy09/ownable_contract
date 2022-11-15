// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

    contract InheritanceTest {

    address ContractOwner;
    mapping (address => bool) user;

    constructor () {
        ContractOwner = msg.sender; 
    }

    modifier onlyOwner() {
        require(msg.sender == ContractOwner, "You are not the owner");
        _;
    }




    function newOwner (address newAddress) public onlyOwner {
        ContractOwner = newAddress;
    }

    function getAddress ()public view returns (address){
        return ContractOwner;
    }

    function addUser (address newuser) public virtual onlyOwner{
        

        if (user[newuser] == true) {
            revert();
        } else {
            user[newuser] = true;
        }

        
    }

      event ownershipTransferred (address indexed olduser ,address indexed newuser);

    function deleteUser (address olduser) public onlyOwner{
        

        if (user[olduser] == false) {
            revert();
        } else {
            user[olduser] = false;
        }

        
    }

    function renounceOwnership () public virtual onlyOwner {
        emit ownershipTransferred (ContractOwner, address(0));
        ContractOwner = address(0);
    

    }

    function transferOwnership(address newowner) public onlyOwner {
        require(newowner != address(0), "new owner is the zero address");
        emit ownershipTransferred(ContractOwner, newowner);
        ContractOwner = newowner;
    }

    
}