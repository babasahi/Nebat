import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nebat/components/home_screen_components.dart';
import 'package:nebat/constants.dart';

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
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
              height: MediaQuery.of(context).size.height / 14,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
              child: Text(plantName.isEmpty ? '....' : plantName),
            ),
            const CameraWidget(),
            const IdentificationButton(),
          ],
        ),
      )),
    );
  }
}
