import 'package:divelog2/src/features/authentication/authentication_service.dart';
import 'package:divelog2/src/features/authentication/signup_screen.dart';
import 'package:divelog2/src/features/data/database_service.dart';
import 'package:divelog2/src/features/data/local/app_database.dart';
import 'package:divelog2/src/features/dives/dive_detail_screen.dart';
import 'package:divelog2/src/features/dives/dive_form_screen.dart';
import 'package:divelog2/src/features/dives/dive_form_view_model.dart';
import 'package:divelog2/src/features/dives/dives_view_model.dart';
import 'package:divelog2/src/features/main/dives_screen.dart';
import 'package:divelog2/src/features/main/home_screen.dart';
import 'package:divelog2/src/features/main/main_screen.dart';
import 'package:divelog2/src/features/main/profile_screen.dart';
import 'package:divelog2/src/features/main/statistics_screen.dart';
import 'package:divelog2/src/features/main/home_view_model.dart';
import 'package:divelog2/src/features/settings/theme_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:divelog2/src/features/authentication/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

// This is a global function that can be overridden for testing
Future<void> Function()? initializeFirebaseAndRunApp = () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('es_ES', null);

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
    final db = database ?? AppDatabase();

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
              routes: [
                GoRoute(
                  path: 'new',
                  builder: (context, state) {
                    final session = state.extra as DiveSession?;
                    return DiveFormScreen(session: session);
                  },
                ),
                GoRoute(
                  path: 'detail',
                  builder: (context, state) {
                    final session = state.extra as DiveSession;
                    return DiveDetailScreen(session: session);
                  },
                ),
              ],
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

    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF0077BE),
      primary: const Color(0xFF0077BE),
      surface: const Color(0xFFF8FAFC),
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
        ChangeNotifierProxyProvider<DatabaseService, DiveFormViewModel>(
          create: (context) => DiveFormViewModel(
              Provider.of<DatabaseService>(context, listen: false)),
          update: (_, db, previous) => previous ?? DiveFormViewModel(db),
        ),
        ChangeNotifierProxyProvider<DatabaseService, DivesViewModel>(
          create: (context) => DivesViewModel(
              Provider.of<DatabaseService>(context, listen: false)),
          update: (_, db, previous) => previous ?? DivesViewModel(db),
        ),
        ChangeNotifierProxyProvider<DatabaseService, HomeViewModel>(
          create: (context) => HomeViewModel(
              Provider.of<DatabaseService>(context, listen: false)),
          update: (_, db, previous) => previous ?? HomeViewModel(db),
        ),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, _) {
          return MaterialApp.router(
            title: 'Dive Log',
            debugShowCheckedModeBanner: false,
            themeMode: themeViewModel.themeMode,
            theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          textTheme: GoogleFonts.plusJakartaSansTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF0077BE), width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0077BE),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              shadowColor: const Color(0xFF0077BE).withValues(alpha: 0.3),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0077BE),
            brightness: Brightness.dark,
            surface: const Color(0xFF0F172A),
          ),
          textTheme: GoogleFonts.plusJakartaSansTextTheme(
            ThemeData.dark().textTheme,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFF1E293B),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF334155)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF0077BE), width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0077BE),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              shadowColor: Colors.black.withValues(alpha: 0.5),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
            routerConfig: router,
          );
        },
      ),
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