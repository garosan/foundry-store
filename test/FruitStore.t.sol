// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FruitStore} from "../src/FruitStore.sol";

contract FruitStoreTest is Test {
    FruitStore fruitStore;

    function setUp() public {
        fruitStore = new FruitStore();
    }

    function buyFruit() public {
        uint256 fruitIndex = 0;
        uint256 quantity = 1;
        uint256 price = 0.001 ether;

        fruitStore.buyFruit{value: price}(fruitIndex, quantity);

        (,, uint256 newQuantity) = fruitStore.getFruit(fruitIndex);
        assertEq(newQuantity, 49, "Quantity should be 49 after purchase");
    }
}
