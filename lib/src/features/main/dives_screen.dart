import 'package:divelog2/src/features/dives/dives_view_model.dart';
import 'package:divelog2/src/features/dives/widgets/dive_session_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DivesScreen extends StatefulWidget {
  const DivesScreen({super.key});

  @override
  State<DivesScreen> createState() => _DivesScreenState();
}

class _DivesScreenState extends State<DivesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DivesViewModel>().fetchDives();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DivesViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.error != null) {
          return Center(child: Text('Error: ${viewModel.error}'));
        }

        if (viewModel.dives.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.scuba_diving, size: 64, color: Colors.grey[300]),
                const SizedBox(height: 16),
                Text(
                  'No has registrado ninguna inmersión todavía.',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                Text(
                  '¡Presiona "+" para empezar!',
                  style: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: viewModel.fetchDives,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 80),
            itemCount: viewModel.dives.length,
            itemBuilder: (context, index) {
              final session = viewModel.dives[index];
              return DiveSessionCard(
                session: session,
                onTap: () {
                  context.go('/dives/detail', extra: session);
                },
              );
            },
          ),
        );
      },
    );
  }
}
