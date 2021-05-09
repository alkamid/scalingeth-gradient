pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {
  address constant public investor1 = 0xE0f5206BBD039e7b0592d8918820024e2a7437b9;
  address constant public investor2 = 0x8d8Ac93776a71686C027284f0892a95a4726e87d;
  address constant public investor3 = 0xEb0Dd6C79E5BA907453Aa883A460584E5E82e3Ae;

  mapping(address => uint8) public balances;

  //event SetPurpose(address sender, string purpose);
  event AddBalance(address investor, uint8 value);

  string public purpose = "Investing in founders!";

  constructor() {
    // what should we do on deploy?
  }


  function addBalance(address investor, uint8 value) public {
    require((value > 0 ) && (value < 100), "0 < value < 100, define balance in % of share pool");
    balances[investor] = value;
    console.log(msg.sender,"set",investor,"balance to 10%");
    emit AddBalance(investor, value);
  }

  function payDividend() public payable {
    address[3] memory investors = [investor1, investor2, investor3];
    uint num_investors = 3;

    for (uint i=0; i<num_investors; i++) {
      uint amount = msg.value * balances[investors[0]] / 100; 
      (bool success, ) = investors[i].call{value: amount}("");
      require(success, "Failed to distribute the dividend");
    }
  }

}
