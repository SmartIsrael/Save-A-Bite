import 'package:flutter/material.dart';
import 'item.dart'; // Importing Item class

class Cart extends StatefulWidget {
  final List<Item> items;

  const Cart({Key? key, required this.items}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Item> cartItems = [];
  late Map<Item, int> quantityMap;

  @override
  void initState() {
    super.initState();
    // Initialize cart items and quantity map
    cartItems = List.from(widget.items);
    quantityMap = Map.fromIterable(
      cartItems,
      key: (item) => item,
      value: (item) => 1, // Initial quantity is 1 for each item
    );
  }

  // Function to increase item quantity
  void increaseQuantity(Item item) {
    setState(() {
      quantityMap[item] = quantityMap[item]! + 1;
    });
  }

  // Function to decrease item quantity
  void decreaseQuantity(Item item) {
    setState(() {
      if (quantityMap[item]! > 1) {
        quantityMap[item] = quantityMap[item]! - 1;
      }
    });
  }

  // Function to calculate total price
  double getTotalPrice() {
    double total = 0.0;
    quantityMap.forEach((item, quantity) {
      total += double.parse(item.price.substring(1)) * quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          final quantity = quantityMap[item]!;
          return ListTile(
            leading: Image.asset(
              item.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(item.name),
            subtitle: Text('Price: ${item.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  onPressed: () => decreaseQuantity(item),
                  icon: const Icon(Icons.remove),
                ),
                Text(quantity.toString()),
                IconButton(
                  onPressed: () => increaseQuantity(item),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${getTotalPrice().toStringAsFixed(2)}', // Display total price formatted
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pickup');
                // Handle checkout or pickup action
                // Implement your logic here
              },
              child: const Text('Checkout / Pickup'),
            ),
          ],
        ),
      ),
    );
  }
}