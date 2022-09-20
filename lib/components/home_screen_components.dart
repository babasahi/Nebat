import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nebat/constants.dart';
import 'package:nebat/screens/home_screen.dart';
import 'package:nebat/services/apis.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
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
        child: resulturl.isEmpty
            ? const Center(child: Icon(FontAwesomeIcons.images))
            : Center(
                child: Image(
                image: NetworkImage(resulturl),
                fit: BoxFit.cover,
                width: double.infinity,
              )),
      ),
    );
  }
}

class IdentificationButton extends StatelessWidget {
  const IdentificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          APIS api = APIS();
          api.identifyPlant();
        },
        child: Material(
          elevation: 6,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: const BoxDecoration(
                color: Colors.greenAccent,
                // border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: 40,
            child: const Text(
              'IDENTIFY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
