// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:nebat/screens/home_screen.dart';

void main() async {
  // cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
