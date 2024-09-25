// SPDX-License-Identifer: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {AlanTokenV2} from "src/AlanTokenV2.sol";

contract DeployAlanTokenV2 is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (AlanTokenV2) {
        vm.startBroadcast();
        // AlanTokenV2 alanTokenV2 = new AlanTokenV2(INITIAL_SUPPLY);
        AlanTokenV2 alanTokenV2 = new AlanTokenV2(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return alanTokenV2;
    }
}
