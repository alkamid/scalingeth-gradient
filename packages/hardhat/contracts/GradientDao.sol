// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

contract GradientDao is ERC1155 {
    address public admin;
    uint256 public constant Claim_TOKEN = 0;
    uint256 public constant YouOweMe_TOKEN = 1;
    mapping(address => string) public Seekers;
    mapping(address => uint256) public Karma;
    mapping(address => uint256) public RoundSize;

    IERC20 public dai;
    event LiquidityAdded(address payer, uint256 amount, uint256 date);

    constructor(address daiAddress)
        public
        ERC1155("https://game.example/api/item/{id}.json")
    {
        dai = IERC20(daiAddress);
    }

    //Based on Karma score calculate max round size in ETH
    function KarmaPower() internal returns (uint256) {
        return (2);
    }

    function SeekFundingRound(uint256 Principle) public {
        RoundSize[msg.sender] = KarmaPower();
    }

    function BecomeLP() public payable {
        //require(LP have first shot at funding)
        //dai.transferFrom(msg.sender, admin, amount);
        emit LiquidityAdded(msg.sender, msg.value, block.timestamp);

        uint256 UnFundedRound = 100 ether;
        require(msg.value <= UnFundedRound, "Value exceeds roundsize");

        _mint(address(this), YouOweMe_TOKEN, msg.value, "");

        dai.transfer(msg.sender, msg.value);
    }

    function Take() public {}

    //Seeker Fills Funds Burns YouOweMe_TOKEN Overflow is returned to LP
    function CloseFundingRound() public {
        //  _mint(LP, Claim_Token, LP_Claim_Value)
    }
}
