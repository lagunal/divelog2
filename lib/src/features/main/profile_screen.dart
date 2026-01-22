import 'package:divelog2/src/features/authentication/authentication_service.dart';
import 'package:divelog2/src/features/settings/theme_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final themeVM = context.watch<ThemeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // User Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              child: Text(
                (user?.displayName?.isNotEmpty == true
                        ? user!.displayName!.substring(0, 1)
                        : user?.email?.isNotEmpty == true
                            ? user!.email!.substring(0, 1)
                            : 'U')
                    .toUpperCase(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user?.displayName ?? 'Usuario',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              user?.email ?? '',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),

            // Settings Section
            _buildSectionHeader('Configuración'),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Modo Oscuro'),
                    secondary: const Icon(Icons.dark_mode),
                    value: themeVM.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      themeVM.setThemeMode(
                          value ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await context.read<AuthenticationService>().signOut();
                  if (context.mounted) {
                    context.go('/login');
                  }
                },
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar Sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  elevation: 0,
                  side: BorderSide(color: Colors.red.withValues(alpha: 0.2)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0077BE),
        ),
      ),
    );
  }
}