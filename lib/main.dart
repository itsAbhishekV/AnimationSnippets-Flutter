import 'package:animatedfloating_button_snippet/feature/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Snippet',
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
