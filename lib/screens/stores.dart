import 'package:flutter/material.dart';

class storespage extends StatefulWidget {
  const storespage({Key? key}) : super(key: key);

  @override
  _storespageState createState() => _storespageState();
}

class _storespageState extends State<storespage> {
  bool isHighestDiscount = true; // Default sort by highest discount

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stores'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search for stores',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHighestDiscount = true;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Highest Discount',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isHighestDiscount ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: isHighestDiscount ? Colors.orange : Colors.transparent,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHighestDiscount = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Lowest Discount',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isHighestDiscount ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: isHighestDiscount ? Colors.transparent : Colors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual number of stores
                itemBuilder: (context, index) {
                  return StoreItem();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0), // Added padding for spacing
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Spread out icons evenly
          children: <Widget>[
            IconButton(
              onPressed: () {
                // Navigate to Home
              },
              icon: const Icon(Icons.home),
              iconSize: 40,
            ),
            const SizedBox(width: 80), // Added space between icons
            IconButton(
              onPressed: () {
                // Navigate to Cart
              },
              icon: const Icon(Icons.shopping_cart),
              iconSize: 40,
            ),
            const SizedBox(width: 80), // Added space between icons
            IconButton(
              onPressed: () {
                // Navigate to Profile
              },
              icon: const Icon(Icons.person),
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Store Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '20% - 10%', // Replace with actual discount
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA08046), // Light orange color
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDA201), // Light orange background color
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle enter store
                    },
                    child: const Text(
                      'Enter store',
                      style: TextStyle(color: Color(0xFFFFFFFF)), // Text color
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 200,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome_image.jpg'), // Replace with actual image asset
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    home: storespage(),
  ));
}