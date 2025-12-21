import 'package:divelog2/src/features/authentication/authentication_service.dart';
import 'package:divelog2/src/features/authentication/signup_screen.dart';
import 'package:divelog2/src/features/main/dives_screen.dart';
import 'package:divelog2/src/features/main/home_screen.dart';
import 'package:divelog2/src/features/main/main_screen.dart';
import 'package:divelog2/src/features/main/profile_screen.dart';
import 'package:divelog2/src/features/main/statistics_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:divelog2/src/features/authentication/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    final auth = firebaseAuth ?? FirebaseAuth.instance;

    final router = GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final isLoggedIn = auth.currentUser != null;
        final isLoggingIn = state.uri.path == '/login';
        final isSigningUp = state.uri.path == '/signup';

        if (!isLoggedIn && !isLoggingIn && !isSigningUp) {
          return '/login';
        }

        if (isLoggedIn && (isLoggingIn || isSigningUp)) {
          return '/';
        }

        return null;
      },
      refreshListenable: StreamListenable(auth.authStateChanges()),
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignupScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return MainScreen(child: child);
          },
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
            GoRoute(
              path: '/dives',
              builder: (context, state) => const DivesScreen(),
            ),
            GoRoute(
              path: '/statistics',
              builder: (context, state) => const StatisticsScreen(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    );

    return Provider<AuthenticationService>(
      create: (_) => AuthenticationService(auth),
      child: MaterialApp.router(routerConfig: router),
    );
  }
}

/// A wrapper class to make a Stream listenable for GoRouter refreshListenable
class StreamListenable extends ChangeNotifier {
  final Stream stream;

  StreamListenable(this.stream) {
    notifyListeners();
    stream.listen((event) => notifyListeners());
  }
}
