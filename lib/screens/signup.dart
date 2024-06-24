import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
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
                'Get \$5 off your first order of \$15 or more',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign up to get started',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
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
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  fillColor: Colors.orange[50],  // Light orange color for the field background
                  filled: true,  // Ensures the fillColor is applied
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent),
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
                    borderSide: BorderSide(color: Colors.orangeAccent),
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
              ToggleSwitch(
                minWidth: 150.0,
                initialLabelIndex: userTypeIndex ?? 0, // Ensure a default value if userTypeIndex is null
                activeBgColor: [Color(0xFFFDA201), Color(0xFFFDA201)], // Background color when selected
                activeFgColor: Colors.white, // Text color when selected
                inactiveBgColor: Color(0xFFFFDFA5),
                inactiveFgColor: Color(0xFFA97424),
                labels: ['I\'m a consumer', 'I\'m a business'],
                onToggle: (index) {
                  setState(() {
                    userTypeIndex = index ?? 0;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle sign up based on selected type
                  Navigator.pushNamed(context, '/home');
                  String userType = userTypeIndex == 0 ? 'Consumer' : 'Business';
                  print('User type selected: $userType');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFDA201),  // Define the color of the button
                  minimumSize: Size(300, 40),  // Increase the width and height of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Reduce the curviness
                  ),
                ),
                child: const Text(
                  'Sign up',
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
                      'Already have an account? Log in',
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