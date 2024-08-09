import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/authService.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      User? user = await _authService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        // Navigate to the appropriate dashboard based on user role
        if (email == "admin@example.com") { // Example check for admin
          Get.offNamed('/admin-dashboard');
        } else {
          Get.offNamed('/user-dashboard');
        }
      }
    } else {
      Get.snackbar("Error", "Email and password must not be empty");
    }
  }
}
