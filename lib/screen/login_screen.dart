import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skincare_app/bottom_screen/bottom_screen.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signIn() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAll(const BottomScreen());
    } catch (e) {
      print('Login Error: $e');
      Get.snackbar(
        'Error',
        'Failed to login. Please check your credentials and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                /// Get current user
                final currentUser = _auth.currentUser;
                if (currentUser != null && currentUser.email != _emailController.text.trim()) {
                  /// If the provided email is different from the current user's email
                  Get.snackbar(
                    'Error',
                    'Another user is already logged in with this email. Please log out first.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                } else {
                  /// If the provided email matches the current user's email or no user is logged in
                  await _signIn();
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
