import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Save-A-Bite',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/food_image.jpg',  // Ensure this image is available in your assets folder.
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Save-A-Bite',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Get access to discounted food from local vendors.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Login Screen
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,  // Define the color of the button
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Signup Screen
                  },
                  child: Text('Signup'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,  // Define the color of the button
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
