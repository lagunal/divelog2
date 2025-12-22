import 'package:divelog2/src/features/authentication/authentication_service.dart';
import 'package:divelog2/src/features/authentication/signup_screen.dart';
import 'package:divelog2/src/features/data/database_service.dart';
import 'package:divelog2/src/features/data/local/app_database.dart';
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

  final database = AppDatabase();

  runApp(MainApp(database: database));
};

void main() async {
  await initializeFirebaseAndRunApp!();
}

class MainApp extends StatelessWidget {
  final FirebaseAuth? firebaseAuth;
  final AppDatabase? database;

  const MainApp({super.key, this.firebaseAuth, this.database});

  @override
  Widget build(BuildContext context) {
    final auth = firebaseAuth ?? FirebaseAuth.instance;
    final db =
        database ??
        AppDatabase(); // Fallback if not provided, though it should be

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

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(auth),
        ),
        Provider<AppDatabase>.value(value: db),
        ProxyProvider<AppDatabase, DatabaseService>(
          update: (_, db, _) => DatabaseService(db),
        ),
      ],
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
