import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies App Home')),
      body: const Center(
        child: Text(
          'Welcome to the Movies App!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
