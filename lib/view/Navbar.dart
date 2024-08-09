import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
        BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reports'),
      ],
      onTap: (index) {
        // Add navigation logic here
      },
    );
  }
}
