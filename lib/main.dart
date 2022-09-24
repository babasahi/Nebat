// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:nebat/screens/home_screen.dart';
import 'package:nebat/services/providers.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';

void main() async {
  // cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Location location =  Location();

bool _serviceEnabled =false;
late PermissionStatus _permissionGranted;
late LocationData _locationData;



_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

final _permissionGranted = await location.hasPermission();
if (permissionGranted == PermissionStatus.denied) {
  permissionGranted = await location.requestPermission();
  if (permissionGranted != PermissionStatus.granted) {
    return;
  }
}

final _locationData = await location.getLocation();
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
