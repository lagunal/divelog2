import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:divelog2/src/features/authentication/login_screen.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('LoginScreen displays title and a button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      expect(
        find.text('Login'),
        findsNWidgets(2),
      ); // AppBar title and button text
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
