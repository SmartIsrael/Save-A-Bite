import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/signup.dart';
import 'screens/login.dart';
import 'screens/homepage.dart';
import 'screens/stores.dart';
import 'screens/restaurant.dart';
import 'screens/aisle.dart';

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
    home: const welcome(),
    routes: {
      '/signup': (context) => const signup(),
      '/login': (context) => const login(),
      '/home': (context) => const homepage(),
      '/stores': (context) => const storespage(),
      '/restaurant': (context) => const restaurantpage(),
      '/aisle': (context) => const aislepage(),
    },
  );
}
}