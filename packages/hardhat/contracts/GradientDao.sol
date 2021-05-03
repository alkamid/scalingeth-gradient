// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GradientDao is ERC1155 {
    uint256 public constant Claim_TOKEN = 0;
    uint256 public constant YouOweMe_TOKEN = 1;
    mapping(address => string) public Seekers;
    mapping(address => uint256) public Karma;
    mapping(address => uint256) public RoundSize;
    IERC20 public dai;

    constructor(address daiAddress) public ERC1155("https://game.example/api/item/{id}.json") {}
    dai = IERC20(daiAddress);
    //Based on Karma score calculate max round size in ETH
    function KarmaPower() internal returns (uint256) {
        return (2);
    }

    function SeekFundingRound(uint256 Principle) public {
        RoundSize[msg.sender] = KarmaPower();
    }

    function BecomeLP() public payable {
        uint256 UnFundedRound = 1 ether;
        require(msg.value <= UnFundedRound, "Value exceeds roundsize");
        _mint(msg.sender, YouOweMe_TOKEN, msg.value, "");
    }

    //Seeker Fills Funds Burns YouOweMe_TOKEN Overflow is returned to LP
    function CloseFundingRound() public {}
}
