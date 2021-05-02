// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract GradiantDao is ERC1155 {
    uint256 public constant EQUITY_TOKEN = 0;
    uint256 public constant YouOweMe_TOKEN = 1;
    mapping(address => string) public Seekers;
    mapping(address => uint256) public Karma;
    mapping(address => uint256) public RoundSize;

    constructor() public ERC1155("https://game.example/api/item/{id}.json") {}

    //Based on Karma score calculate max round size in ETH
    function KarmaPower() internal returns (uint256) {
        return (2);
    }

    function SeekFundingRound(uint256 Principle) public {
        RoundSize[msg.sender] = KarmaPower();
    }

    function BecomeLP() public payable {
        uint256 _RoundSize = 8;
        _mint(msg.sender, YouOweMe_TOKEN, _RoundSize, "");
    }

    //Seeker Fills Funds Burns YouOweMe_TOKEN Overflow is returned to LP
    function CloseFundingRound() public {}
}
