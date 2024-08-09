import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathertask/view/uploadExcelScreen.dart';

class UserDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
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
                Get.to(() => UploadExcelScreen());
              },
              child: Text('Upload Excel File'),
            ),
            // Add more buttons or widgets for other user functionalities
          ],
        ),
      ),
    );
  }
}
