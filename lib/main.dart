// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:nebat/screens/home_screen.dart';
import 'package:nebat/services/providers.dart';
import 'package:provider/provider.dart';

void main() async {
  // cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider(
        create: (context) => Services(),
        builder: ((context, child) {
          return const HomePage();
        }),
      ),
    );
  }
}
