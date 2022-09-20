import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: 40,
            child: const Text('IDENTIFY')));
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

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = (await picker.pickImage(source: ImageSource.camera));

    setState(() {
      image = File(file!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        await pickImage();
      }),
      child: Container(
        height: (MediaQuery.of(context).size.height / 1.5),
        width: double.infinity,
        margin: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 12, color: Colors.deepPurpleAccent),
        ),
        child: image == null
            ? const Center(child: Icon(FontAwesomeIcons.images))
            : Center(
                child: Image(
                image: FileImage(image!),
                fit: BoxFit.cover,
                width: double.infinity,
              )),
      ),
    );
  }
}
