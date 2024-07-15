import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/signup.dart';
import 'screens/login.dart';
import 'screens/homepage.dart';
import 'screens/stores.dart';
import 'screens/restaurant.dart';
import 'screens/aisle.dart';
import 'screens/aisle_detail.dart';
import 'screens/cart.dart'; // Importing cart.dart
import 'screens/item.dart';
import 'screens/pickup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save-A-Bite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome', // Changed welcome() to Welcome()
      home: const welcome(),
      routes: {
        '/signup': (context) => const signup(),
        '/login': (context) => const login(),
        '/home': (context) => const homepage(),
        '/stores': (context) => const storespage(),
        '/restaurant': (context) => const restaurantpage(),
        '/aisle': (context) => const aislepage(),
        '/pickup': (context) => const pickup(),
        '/welcome': (context) => const welcome(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/aisledetail') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return aisledetailpage(
                aisleName: args['aisleName']!,
                aisleImagePath: args['aisleImagePath']!,
              );
            },
          );
        } else if (settings.name == '/cart') {
          final args = settings.arguments as List<Item>; // Fetch items from arguments
          return MaterialPageRoute(
            builder: (context) => Cart(items: args), // Pass items to Cart widget
          );
        }
        return null;
      },
    );
  }
}
