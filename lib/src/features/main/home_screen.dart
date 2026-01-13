import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Pantalla de Inicio')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Agregar Inmersión',
        onPressed: () {
          context.go('/dives/new');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
