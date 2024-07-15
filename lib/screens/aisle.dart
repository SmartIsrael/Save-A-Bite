import 'package:flutter/material.dart';
import 'aisle_detail.dart';

class aislepage extends StatefulWidget {
  const aislepage({Key? key}) : super(key: key);

  @override
  _aislepageState createState() => _aislepageState();
}

class _aislepageState extends State<aislepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a shopping aisle'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Search shopping aisle',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: aisleItems.length,
                itemBuilder: (context, index) {
                  return AisleItemCard(
                    aisle: aisleItems[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => aisledetailpage(
                            aisleName: aisleItems[index].name,
                            aisleImagePath: aisleItems[index].imagePath,
                          ),
                        ),
                      );
                    },
                  );
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
                Navigator.pushNamed(context, '/home');
                // Navigate to Home
              },
              icon: const Icon(Icons.home),
              iconSize: 40,
            ),
            const SizedBox(width: 80), // Added space between icons
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stores');
                // Navigate to Stores
              },
              icon: const Icon(Icons.shopping_cart),
              iconSize: 40,
            ),
            const SizedBox(width: 80), // Added space between icons
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
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

class Aisle {
  final String name;
  final String imagePath;

  Aisle({required this.name, required this.imagePath});
}

// Sample data for aisles
List<Aisle> aisleItems = [
  Aisle(name: 'Snacks', imagePath: 'assets/snacks.jpg'),
  Aisle(name: 'Vegetable', imagePath: 'assets/vegetables.jpg'),
  Aisle(name: 'Frozen Food', imagePath: 'assets/frozen_food.png'),
  Aisle(name: 'Pastries & Bakery', imagePath: 'assets/bakery.jpg'),
  Aisle(name: 'Drinks', imagePath: 'assets/drink.jpg'),
];

class AisleItemCard extends StatelessWidget {
  final Aisle aisle;
  final VoidCallback onTap;

  const AisleItemCard({
    required this.aisle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.orange, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image.asset(
                    aisle.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.7),
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      aisle.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: aislepage(),
  ));
}
