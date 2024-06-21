import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Save-A-Bite',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const Welcome(),
    routes: {
      '/signup': (context) => const signup(),
    },
  );
}
}