import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [CameraWidget(), IdentificationButton()],
      )),
    );
  }
}

class IdentificationButton extends StatelessWidget {
  const IdentificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: 40,
            child: const Text('Identify')));
  }
}

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        final ImagePicker picker = ImagePicker();
        image = (await picker.pickImage(source: ImageSource.camera)) as File?;
      }),
      child: Container(
        height: (MediaQuery.of(context).size.height / 3) * 2,
        margin: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 12, color: Colors.deepPurpleAccent),
        ),
        child: image == null
            ? const Text('Gallery')
            : Image(image: FileImage(image!)),
      ),
    );
  }
}
