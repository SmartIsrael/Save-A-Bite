import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toggle_switch/toggle_switch.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<login> {
  int userTypeIndex = 0; // 0 for consumer, 1 for business

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              const Text(
                'Save-A-Bite',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  fillColor: Colors.orange[50],  // Light orange color for the field background
                  filled: true,  // Ensures the fillColor is applied
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFDA201)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.deepOrange),  // Darker shade of orange for the text
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  fillColor: Colors.orange[50],  // Light orange color for the field background
                  filled: true,  // Ensures the fillColor is applied
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFDA201)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.deepOrange),  // Darker shade of orange for the text
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Handle login
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFDA201),  // Define the color of the button
                  minimumSize: Size(300, 40),  // Increase the width and height of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Reduce the curviness
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10), // Adjust the spacing as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Color(0xFFFDA201)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}