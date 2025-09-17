import 'package:flutter/material.dart';
import 'package:learning_app_73azn/screens/home_screen.dart';
import 'package:learning_app_73azn/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
