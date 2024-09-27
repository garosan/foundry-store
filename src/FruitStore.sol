// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FruitStore {
    struct Fruit {
        string name;
        uint256 price;
        uint256 quantity;
    }

    Fruit[] public fruits;

    event FruitPurchased(string name, uint256 quantity, uint256 price);

    constructor() {
        fruits.push(Fruit("Apple", 0.0001 ether, 4));
        fruits.push(Fruit("Banana", 0.0002 ether, 4));
        fruits.push(Fruit("Orange", 0.0003 ether, 4));
    }

    // Buy a fruit function
    function buyFruit(uint256 fruitIndex, uint256 quantity) external payable {
        require(fruitIndex < fruits.length, "Invalid fruit index");
        require(quantity > 0, "Quantity must be greater than zero");

        Fruit storage fruit = fruits[fruitIndex];
        uint256 totalCost = fruit.price * quantity;

        require(msg.value >= totalCost, "Insufficient Ether sent");
        require(fruit.quantity >= quantity, "Not enough fruit in stock");

        fruit.quantity -= quantity;

        emit FruitPurchased(fruit.name, quantity, totalCost);

        if (msg.value > totalCost) {
            payable(msg.sender).transfer(msg.value - totalCost);
        }
    }

    // Get fruit details
    function getFruit(uint256 fruitIndex) external view returns (string memory, uint256, uint256) {
        require(fruitIndex < 3, "Invalid fruit index");
        Fruit storage fruit = fruits[fruitIndex];
        return (fruit.name, fruit.price, fruit.quantity);
    }
}
