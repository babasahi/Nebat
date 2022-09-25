// ignore_for_file: avoid_print, prefer_final_fields
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  for (var map in mapsList) {}
  return [];
}

class IdentificationProvider extends ChangeNotifier {
  File? _image;
  bool _isLoading = false;
  IdentificationState _state = IdentificationState.noimage;
  String _name = '.....';
  bool _isImageSet = false;
  List<Plant> _plants = [];
  Position? _position;
  Widget buttonLabel =
      const ButtonWidget(text: 'CAPTURE', icon: FontAwesomeIcons.camera);

  Position? get position => _position;
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _position = await Geolocator.getCurrentPosition();
  }

  String get name => _name;
  bool get isLoading => _isLoading;
  File get image => _image!;
  bool get isImageSet => _isImageSet;
  List<Plant> get plants => _plants;
  IdentificationState get state => _state;

  init() {}
  Future<void> identify() async {
    PlantsAPI api = PlantsAPI();
    try {
      _isLoading = true;
      notifyListeners();
      _plants = await api.identifyPlant(toBase64(
        _image!,
      ));
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
      _isLoading = false;
      notifyListeners();
      print(e);
    }
  }

  Future<void> addPlantToDatabase(Plant plant) async {
    PlantsDatabase db = PlantsDatabase();
    db.addPlantToDatabase(plant);
  }

  Future<void> pickImage() async {
    // print('capturing image...');
    // final ImagePicker picker = ImagePicker();
    // XFile? file = (await picker.pickImage(source: ImageSource.camera));
    // print('image captured');
    // _image = File(file!.path);
    // _isImageSet = true;
    // _state = IdentificationState.image;
    // buttonLabel = const ButtonWidget(
    //   text: 'IDENTIFY',
    //   icon: FontAwesomeIcons.magnifyingGlass,
    // );
    // notifyListeners();
  }

  String toBase64(File file) {
    List<int> bytes = image.readAsBytesSync();
    print('converted image to base64');
    return base64Encode(bytes);
  }
}

class PlantsDatabaseProvider extends ChangeNotifier {
  Future<List<Plant>> plants() async {
    return [];
  }
}
