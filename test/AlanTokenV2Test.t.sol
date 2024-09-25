// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployAlanTokenV2} from "script/DeployAlanTokenV2.s.sol";
import {AlanTokenV2} from "src/AlanTokenV2.sol";

contract AlanTokenV2Test is Test {
    AlanTokenV2 public alanTokenV2;
    DeployAlanTokenV2 public deployer;

    uint256 public constant STARTING_BALANCE = 100 ether;

    address PLAYER1 = makeAddr("player1");
    address PLAYER2 = makeAddr("player2");

    function setUp() public {
        deployer = new DeployAlanTokenV2();
        (alanTokenV2) = deployer.run();

        vm.prank(msg.sender);
        alanTokenV2.transfer(PLAYER1, STARTING_BALANCE);
    }

    function testBalance() public view {
        assertEq(STARTING_BALANCE, alanTokenV2.balanceOf(PLAYER1));
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;
        uint256 transferAmmount = 500;

        vm.prank(PLAYER1);
        alanTokenV2.approve(PLAYER2, initialAllowance);

        vm.prank(PLAYER2);
        alanTokenV2.transferFrom(PLAYER1, PLAYER2, transferAmmount);

        assertEq(alanTokenV2.balanceOf(PLAYER2), transferAmmount);
        assertEq(
            alanTokenV2.balanceOf(PLAYER1),
            STARTING_BALANCE - transferAmmount
        );
    }
}
