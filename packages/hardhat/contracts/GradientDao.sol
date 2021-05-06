// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155Holder.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

contract GradientDao is ERC1155, ERC1155Holder {
    uint256 public constant Claim_TOKEN = 0;
    uint256 public constant YouOweMe_TOKEN = 1;

    struct Seeker {
        address id;
        uint256 karma;
    }
    address public Dai;

    constructor(address daiAddress)
        public
        ERC1155("https://game.example/api/item/{id}.json")
    {
        Dai = daiAddress;
    }

    IERC20 public dai = IERC20(Dai);

    event FundingAdded(address payer, uint256 amount, uint256 date);

    // //Based on Karma score calculate max round size in ETH
    // function KarmaPower() internal returns (uint256) {
    //     return (Seeker.karma);
    // // }

    function SeekFundingRound(uint256 funding) public {
        _mint(address(this), YouOweMe_TOKEN, funding, "");
        // if (msg.sender)
        // RoundSize[msg.sender] = KarmaPower();
    }

    function ApproveFunding(uint256 funding) public {
        //dai.increaseAllowance(address(this), funding);
    }

    function Allowance() public returns (uint256) {
        uint256 _allowance = dai.allowance(msg.sender, address(this));
        console.log(_allowance);
        return _allowance;
    }

    function DepositFunding(uint256 funding) public {
        //dai.transfer(address(this), msg.value);
        dai.transferFrom(msg.sender, address(this), funding);
    }

    function ClaimReward() public {
        //LP claims reward after round sending YouOweMe_TOKEN
    }

    //Seeker Fills Funds Burns YouOweMe_TOKEN Overflow is returned to LP
    function CloseFundingRound() public {
        //  _mint(LP, Claim_Token, LP_Claim_Value)
    }
}
