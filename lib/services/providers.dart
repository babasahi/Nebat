// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nebat/models/models.dart';

class Services extends ChangeNotifier {
  File? _image;
  final String _base64Image = '';
  final bool _isImageSet = false;
  final List<Plant> _plants = [];
  final bool _isPlant = false;

  File get image => _image!;
  bool get isImageSet => _isImageSet;
  bool get isPlant => _isPlant;
  List<Plant> get plans => _plants;
  String get base64Image {
    return toBase64(image);
  }

  Future<File> pickImage() async {
    print('capturing image...');
    final ImagePicker picker = ImagePicker();
    XFile? file = (await picker.pickImage(source: ImageSource.camera));
    print('image captured');
    return File(file!.path);
  }

  String toBase64(File file) {
    print('converting image to base64...');

    List<int> bytes = image.readAsBytesSync();
    print('converted image to base64');
    return base64Encode(bytes);
  }
}
