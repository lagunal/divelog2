import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Home Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to DiveFormScreen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Add Dive clicked')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
