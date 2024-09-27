// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FruitStore} from "../src/FruitStore.sol";

contract FruitStoreScript is Script {
    FruitStore fruitStore;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        fruitStore = new FruitStore();

        vm.stopBroadcast();
    }
}
