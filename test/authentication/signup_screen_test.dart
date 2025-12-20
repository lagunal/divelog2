import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:divelog2/src/features/authentication/signup_screen.dart';

void main() {
  group('SignupScreen', () {
    testWidgets('SignupScreen displays title and a button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

      expect(
        find.text('Sign Up'),
        findsNWidgets(2),
      ); // AppBar title and button text
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
