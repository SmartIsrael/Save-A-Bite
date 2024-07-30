import 'package:flutter/material.dart';

class Item {
  final String name;
  final String imagePath;
  final String discount;
  final String price;

  Item({
    required this.name,
    required this.imagePath,
    required this.discount,
    required this.price,
  });
}

// Sample items for demonstration
List<Item> initialItems = [
  Item(name: 'Item 1', imagePath: 'assets/snacks.jpeg', discount: '10%', price: '\$10'),
  Item(name: 'Item 2', imagePath: 'assets/snacks.jpeg', discount: '15%', price: '\$20'),
  Item(name: 'Item 3', imagePath: 'assets/snacks.jpeg', discount: '20%', price: '\$30'),
  Item(name: 'Item 4', imagePath: 'assets/snacks.jpeg', discount: '25%', price: '\$40'),
  Item(name: 'Item 5', imagePath: 'assets/snacks.jpeg', discount: '30%', price: '\$50'),
];