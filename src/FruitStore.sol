// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FruitStore {
    struct Fruit {
        string name;
        uint256 price;
        uint256 quantity;
    }

    Fruit[5] public fruits;

    event FruitPurchased(string name, uint256 quantity, uint256 price);

    constructor() {
        fruits[0] = Fruit("Apple", 0.001 ether, 50);
        fruits[1] = Fruit("Banana", 0.002 ether, 50);
        fruits[2] = Fruit("Orange", 0.003 ether, 50);
        fruits[3] = Fruit("Lemon", 0.004 ether, 50);
        fruits[4] = Fruit("Mango", 0.005 ether, 50);
    }

    // Buy a fruit function
    function buyFruit(uint256 fruitIndex, uint256 quantity) external payable {
        require(fruitIndex < 5, "Invalid fruit index");
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
        require(fruitIndex < 5, "Invalid fruit index");
        Fruit storage fruit = fruits[fruitIndex];
        return (fruit.name, fruit.price, fruit.quantity);
    }

    // Function to retrieve funds (only owner)
    function withdraw() external {
        payable(msg.sender).transfer(address(this).balance);
    }
}
