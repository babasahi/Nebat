import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nebat/components/home_screen_components.dart';

File? image;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const PlantNameWidget(),
            const CameraWidget(),
            image != null ? const IdentificationButton() : const SizedBox(),
          ],
        ),
      )),
    );
  }
}
