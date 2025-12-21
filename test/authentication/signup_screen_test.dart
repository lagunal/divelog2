import 'package:divelog2/src/features/authentication/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:divelog2/src/features/authentication/signup_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockAuthenticationService extends Mock implements AuthenticationService {}

void main() {
  late MockAuthenticationService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthenticationService();
  });

  Widget createWidgetUnderTest() {
    return Provider<AuthenticationService>(
      create: (_) => mockAuthService,
      child: const MaterialApp(
        home: SignupScreen(),
      ),
    );
  }

  group('SignupScreen', () {
    testWidgets('renders email and password fields', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Sign Up'), findsNWidgets(2)); // AppBar title and Button text
    });

    testWidgets('calls signUp when form is valid and button is pressed', (
      WidgetTester tester,
    ) async {
      when(
        () => mockAuthService.signUp(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@example.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'),
        'password123',
      );

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      verify(
        () => mockAuthService.signUp(
          email: 'test@example.com',
          password: 'password123',
        ),
      ).called(1);
    });

    testWidgets('shows error when signUp fails', (WidgetTester tester) async {
      when(
        () => mockAuthService.signUp(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(Exception('Signup failed'));

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        'test@example.com',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'),
        'password123',
      );

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
      await tester.pump();

      expect(find.text('Exception: Signup failed'), findsOneWidget);
    });
  });
}