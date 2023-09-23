import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'splash.dart'; // Import your Splash screen widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Use a custom Splash screen widget with a 3-second delay
      home: SplashScreen(
        duration: Duration(seconds: 3), // Set the duration for 3 seconds
        navigateAfterDuration: LoginPage(), // Navigate to LoginPage after the delay
      ),
    );
  }
}
