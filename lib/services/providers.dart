// ignore_for_file: avoid_print, prefer_final_fields
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nebat/components/home_screen_components.dart';
import 'package:nebat/models/models.dart';
import 'package:nebat/services/apis.dart';

enum IdentificationState {
  noimage,
  image,
  identified,
}

List<Plant> plantMapsToModels(List<Map<String, dynamic>> mapsList) {
  List<Plant> plants = [];
  for (var map in mapsList) {
    plants.add(Plant.fromJson(map));
  }
  return plants;
}

class IdentificationProvider extends ChangeNotifier {
  File? _image;
  bool _isLoading = false;
  IdentificationState _state = IdentificationState.noimage;
  String _name = '.....';
  bool _isImageSet = false;
  List<Plant> _plants = [];
  PlantsAPI api = PlantsAPI();

  Widget buttonLabel =
      const ButtonWidget(text: 'CAPTURE', icon: FontAwesomeIcons.camera);

  String get name => _name;
  bool get isLoading => _isLoading;
  File get image => _image!;
  bool get isImageSet => _isImageSet;
  List<Plant> get plants => _plants;
  IdentificationState get state => _state;

  Future<void> identify() async {
    try {
      // show loading spinner ...
      _isLoading = true;
      notifyListeners();
      _plants = await api.identifyPlant(toBase64(image));
      if (_plants.isNotEmpty) {
        _name = _plants[0].plantName;
        _state = IdentificationState.identified;
        buttonLabel = const ButtonWidget(
          text: 'RETRY',
          icon: FontAwesomeIcons.arrowsRotate,
        );
        _isLoading = false;

        notifyListeners();
      }
    } catch (e) {
      // hide loading spinner
      _isLoading = false;
      notifyListeners();
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
    _state = IdentificationState.image;
    buttonLabel = const ButtonWidget(
      text: 'IDENTIFY',
      icon: FontAwesomeIcons.magnifyingGlass,
    );
    notifyListeners();
  }

  String toBase64(File imageFile) {
    List<int> bytes = imageFile.readAsBytesSync();
    print('converted image to base64');
    return base64Encode(bytes);
  }

  Future<String> getPlantImage(String plantName) async {
    return await api.getImageFromWeb(plantName);
  }
}
