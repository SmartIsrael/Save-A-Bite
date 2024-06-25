import 'package:flutter/material.dart';
import 'stores.dart';  // Import the StoresPage
import 'restaurant.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Save-A-Bite',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 5),
            const Text(
              'Welcome back, Dave!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Discover stores and restaurants near you',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40), // Increased spacing for better layout
            CircleButton(
              label: 'Restaurant',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const restaurantpage()),
                );
              },
            ),
            const SizedBox(height: 20), // Spacing between buttons
            CircleButton(
              label: 'Stores',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const storespage()),
                );
              },
            ),
        const SizedBox(height: 20),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0), // Added padding to spread apart icons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Use spaceBetween to spread out the icons
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      // Navigate to Home
                    },
                    icon: const Icon(Icons.home),
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        // Navigate to Cart
                      },
                      icon: const Icon(Icons.shopping_cart),
                      iconSize: 40,
                    ),
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
            ),
        ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const CircleButton({
    required this.label,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.orange,
            width: 25, // Increased border thickness
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.orange, // Colored text orange
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const homepage(),
  ));
}
