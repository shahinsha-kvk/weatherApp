import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/logincontroller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _loginController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _loginController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _loginController.login(),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
