// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nebat/screens/home_screen.dart';
import 'package:nebat/services/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Position _position;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => IdentificationProvider(),
        builder: ((context, child) {
          return const HomePage();
        }),
      ),
    );
  }
}
