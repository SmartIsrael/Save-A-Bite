import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save A Bite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Save A Bite Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildMapPlaceholder(),
            _buildNotificationSection(),
            _buildUserProfile(),
            // const Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Text(
            //     'You have pushed the button this many times:',
            //   ),
            // ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  // Widget for map placeholder
  Widget _buildMapPlaceholder() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Text(
          'Map Placeholder',
          style: TextStyle(color: Colors.grey[600], fontSize: 18),
        ),
      ),
    );
  }

  // Widget for notifications section
  Widget _buildNotificationSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Notifications',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          _buildNotificationItem('50% off on surplus food at XYZ Restaurant'),
          _buildNotificationItem('New deal: Grocery discounts at ABC Supermarket'),
          _buildNotificationItem('Your food pickup is ready at DEF Store'),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  // Widget for user profile section
  Widget _buildUserProfile() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'User Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey[600]),
            ),
            title: const Text('John Doe'),
            subtitle: const Text('johndoe@example.com'),
          ),
          const ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Savings'),
            subtitle: Text('You have saved \$50.00'),
          ),
          const ListTile(
            leading: Icon(Icons.eco),
            title: Text('Environmental Impact'),
            subtitle: Text('You helped save 10 kg of CO2'),
          ),
        ],
      ),
    );
  }
}
