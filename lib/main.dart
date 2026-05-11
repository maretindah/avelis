import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AvelisApp());
}

class AvelisApp extends StatelessWidget {
  const AvelisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avelis',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
