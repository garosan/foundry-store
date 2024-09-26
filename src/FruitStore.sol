// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FruitStore {
    struct Fruit {
        string name;
        uint256 price;
        uint256 quantity;
    }

    Fruit[5] public fruits;

    constructor() {
        fruits[0] = Fruit("Apple", 0.001 ether, 50);
        fruits[1] = Fruit("Banana", 0.002 ether, 50);
        fruits[2] = Fruit("Orange", 0.003 ether, 50);
        fruits[3] = Fruit("Lemon", 0.004 ether, 50);
        fruits[4] = Fruit("Mango", 0.005 ether, 50);
    }

    // Buy a fruit function

    // Get X fruit function

    // Function to retrieve funds
}
