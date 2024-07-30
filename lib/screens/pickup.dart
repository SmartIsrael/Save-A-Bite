import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class pickup extends StatelessWidget {
  const pickup({Key? key}) : super(key: key);

  final LatLng _storeLocation = const LatLng(37.7749, -122.4194); // Example coordinates (San Francisco)

  void _launchMaps() async {
    const url = 'https://www.google.com/maps/search/?api=1&query=37.7749,-122.4194'; // Replace with actual coordinates
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _storeLocation,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('storeLocation'),
                    position: _storeLocation,
                    infoWindow: InfoWindow(title: 'Example Store'),
                  ),
                },
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _launchMaps,
              child: Container(
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Open Google Maps',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Store Name: Example Store',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Store Hours: 9:00 AM - 9:00 PM',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle book action
              },
              child: const Text('Book'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: const Icon(Icons.home),
              iconSize: 40,
            ),
            const SizedBox(width: 80),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: const Icon(Icons.shopping_cart),
              iconSize: 40,
            ),
            const SizedBox(width: 80),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
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