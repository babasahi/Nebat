// ignore_for_file: avoid_print, prefer_final_fields

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nebat/models/models.dart';
import 'package:nebat/services/apis.dart';

class IdentificationProvider extends ChangeNotifier {
  File? _image;
  String _name = '.....';
  bool _isImageSet = false;
  List<Plant> _plants = [];

  String get name => _name;
  File get image => _image!;
  bool get isImageSet => _isImageSet;

  List<Plant> get plants => _plants;

  Future<void> identify() async {
    APIS api = APIS();
    try {
      _plants = await api.identifyPlant(toBase64(_image!));
      if (_plants.isNotEmpty) {
        _name = _plants[0].plantName;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> pickImage() async {
    print('capturing image...');
    final ImagePicker picker = ImagePicker();
    XFile? file = (await picker.pickImage(source: ImageSource.camera));
    print('image captured');
    _image = File(file!.path);
    _isImageSet = true;
    notifyListeners();
  }

  String toBase64(File file) {
    print('converting image to base64...');

    List<int> bytes = image.readAsBytesSync();
    print('converted image to base64');
    return base64Encode(bytes);
  }
}
