import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign Up Screen'),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement signup logic
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
