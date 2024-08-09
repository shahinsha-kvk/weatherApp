import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'adminAddLocationScreen.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Add logic to sign out
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => AddLocationScreen());
              },
              child: Text('Add Location'),
            ),
            // Add more buttons or widgets for other admin functionalities
          ],
        ),
      ),
    );
  }
}
