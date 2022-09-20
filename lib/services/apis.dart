// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:nebat/constants.dart';

import 'package:http/http.dart' as http;
import 'package:nebat/models/models.dart';
import 'package:nebat/screens/home_screen.dart';

class APIS {
  final String _apikey = 'nGFgz6bm5mpkvgOVdhCdU31WjIJHEbGAOEEahX3klSkxcnsmpj';
  final String _endpoint = 'https://api.plant.id/v2/identify';

  Future<File> pickImage() async {
    print('capturing image...');
    final ImagePicker picker = ImagePicker();
    XFile? file = (await picker.pickImage(source: ImageSource.camera));
    print('image captured');
    return File(file!.path);
  }

  String toBase64(File file) {
    print('converting image to base64...');

    List<int> bytes = image!.readAsBytesSync();
    print('converted image to base64');
    return base64Encode(bytes);
  }

  Future<void> identifyPlant(List<File> imageFiles) async {
    List<String> images = [];
    for (var file in imageFiles) {
      images.add(toBase64(file));
    }

    Map<String, dynamic> body = {'images': images};
    try {
      print('sending request...');
      http.Response response = await http.post(
        Uri.parse(_endpoint),
        headers: {
          'Accept': '*/*',
          'Access-Control-Allow-Origin': '*',
          'Api-Key': _apikey,
        },
        body: jsonEncode(body),
      );
      print('got response ');
      print('parsing response...');
      print(response.body);
      Map<String, dynamic> results =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (results['is_plant']) {
        Map<String, dynamic> s = results['suggestions'][0];
        bestresult = Plant(
            id: s['id'] as int,
            plantName: s['plant_name'] as String,
            imagePath: results['images'][0]['url'] as String,
            images: [],
            suggestions: []);
      } else {
        print('this is not plant');
      }
    } catch (e) {
      print(e);
    }
  }
}
