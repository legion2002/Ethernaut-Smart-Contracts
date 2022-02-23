// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Telephone {

  address public owner;
  address public currTx;
  address public currSender;

  constructor() public {
    owner = 0x0b6F6CE4BCfB70525A31454292017F640C10c768;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
  
  function getorigin() public returns(address a){
      currTx = tx.origin;
      currSender = msg.sender;
      return(tx.origin);
  }
}
