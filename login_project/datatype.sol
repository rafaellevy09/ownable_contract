// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract identity {

    bytes32 private globalPassword = "Bitcoin";
    int public loginCount = 0;
    bool public loginStatus; 

    

    function indentify(bytes32 password) public returns (bool) {
        if (globalPassword == password && loginCount < 10) {
            loginCount++;
            return true;
        } else {
            return false;
        }
    }

    function loginstat() public returns (bool) {
        if (loginStatus == true) {
            revert();
        } else {
            loginStatus = true;
            return true;
        }

    }

    function getLoginStatus(uint get) public returns (uint) {
        if (loginStatus == true) {
            return 1;
        } else {
            return 0;
        }
        
    } 
 }
