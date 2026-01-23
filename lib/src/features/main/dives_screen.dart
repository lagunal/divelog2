import 'package:divelog2/src/features/dives/dives_view_model.dart';
import 'package:divelog2/src/features/dives/widgets/dive_session_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DivesScreen extends StatefulWidget {
  const DivesScreen({super.key});

  @override
  State<DivesScreen> createState() => _DivesScreenState();
}

class _DivesScreenState extends State<DivesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DivesViewModel>().fetchDives();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Diario de Buceo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/profile'),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: const Color(0xFFE0CBA8), // Skin tone-ish placeholder
                          child: Text(
                            user?.displayName?.substring(0, 1).toUpperCase() ?? 'U',
                            style: const TextStyle(
                              color: Color(0xFF5D4037),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981), // Online/Active green
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar inmersiones...',
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onChanged: (value) {
                    // TODO: Implement search logic in ViewModel
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<DivesViewModel>(
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
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () {
            context.go('/dives/new');
          },
          backgroundColor: const Color(0xFF00B4DB),
          elevation: 4,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 32, color: Colors.white),
        ),
      ),
    );
  }
}
