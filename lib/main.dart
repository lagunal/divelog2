import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:divelog2/src/features/authentication/authentication_service.dart';
import 'package:divelog2/src/features/authentication/login_screen.dart';

// This is a global function that can be overridden for testing
Future<void> Function()? initializeFirebaseAndRunApp = () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
};

void main() async {
  await initializeFirebaseAndRunApp!();
}

class MainApp extends StatelessWidget {
  final FirebaseAuth? firebaseAuth;
  const MainApp({super.key, this.firebaseAuth});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: AuthenticationService(
          firebaseAuth ?? FirebaseAuth.instance,
        ).authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Loading indicator
          }
          if (snapshot.hasData) {
            return MainScreen(firebaseAuth: firebaseAuth); // User is logged in
          }
          return const LoginScreen(); // User is not logged in
        },
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final FirebaseAuth? firebaseAuth;
  const MainScreen({super.key, this.firebaseAuth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dive Log'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthenticationService(
                firebaseAuth ?? FirebaseAuth.instance,
              ).signOut();
            },
          ),
        ],
      ),
      body: const Center(child: Text('Welcome to Dive Log!')),
    );
  }
}
