import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weathertask/view/adminHome.dart';
import 'package:weathertask/view/loginpage.dart';
import 'package:weathertask/view/uploadExcelScreen.dart';
import 'package:weathertask/view/userHome.dart';
import 'package:weathertask/view/weatherReportScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'your-api-key',
      appId: '1:752402761656:android:126253377e416f742e314d',
      messagingSenderId: '752402761656',
      projectId: 'primalcodetaskweather',
      storageBucket: 'your-storage-bucket-url',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      initialRoute:'/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/admin-dashboard', page: () => AdminDashboardScreen()),
        GetPage(name: '/user-dashboard', page: () => UserDashboardScreen()),
        GetPage(name: '/upload-excel', page: () => UploadExcelScreen()),
        // GetPage(name: '/weather-report', page: () => WeatherReportScreen()),
      ],
    );
  }
}
