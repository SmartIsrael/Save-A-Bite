import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Save-A-Bite',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/welcome_image.jpg',  // Ensure this image is available in your assets folder.
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 0),
            const Text(
              'Welcome to Save-A-Bite',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Get access to discounted food from local vendors.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 230),  // Adjust this value as needed to balance the spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Login Screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,  // Define the color of the button
                  ),
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Signup Screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,  // Define the color of the button
                  ),
                  child: const Text('Signup'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
