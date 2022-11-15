// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "./inheritance.sol";


contract child is InheritanceTest{

mapping (address => bool) users;

function addUser (address newuser) public virtual override onlyOwner{
        

        if (users[newuser] == true) {
            revert();
        } else {
            users[newuser] = true;
        }

        
    }

 function renounceOwnership() public virtual override onlyOwner {
        revert("can't renounceOwnership here!");
 }

}