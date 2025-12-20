import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:divelog2/src/features/authentication/authentication_service.dart';

// Mock Firebase Auth
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock User
class MockUser extends Mock implements User {}

// Mock UserCredential
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late AuthenticationService authenticationService;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    mockUserCredential = MockUserCredential();
    authenticationService = AuthenticationService(mockFirebaseAuth);

    // Register fallback values for objects passed to `any()`
    registerFallbackValue(mockUser);
    registerFallbackValue(mockUserCredential);
    registerFallbackValue(Stream<User?>.empty()); // for authStateChanges stream
  });

  group('AuthenticationService', () {
    test('authStateChanges returns a stream of User', () {
      when(
        () => mockFirebaseAuth.authStateChanges(),
      ).thenAnswer((_) => Stream.fromIterable([mockUser]));
      expect(authenticationService.authStateChanges, emits(mockUser));
    });

    test('signIn calls signInWithEmailAndPassword', () async {
      when(
        () => mockFirebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => mockUserCredential);

      await authenticationService.signIn(
        email: 'test@example.com',
        password: 'password123',
      );

      verify(
        () => mockFirebaseAuth.signInWithEmailAndPassword(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('signUp calls createUserWithEmailAndPassword', () async {
      when(
        () => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => mockUserCredential);

      await authenticationService.signUp(
        email: 'test@example.com',
        password: 'password123',
      );

      verify(
        () => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('signOut calls signOut', () async {
      when(
        () => mockFirebaseAuth.signOut(),
      ).thenAnswer((_) async => Future.value()); // Mock returns Future<void>
      await authenticationService.signOut();
      verify(() => mockFirebaseAuth.signOut()).called(1);
    });
  });
}
