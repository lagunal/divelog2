import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Pantalla de Inicio')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Agregar Inmersión',
        onPressed: () {
          // TODO: Navigate to DiveFormScreen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Agregar inmersión')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}