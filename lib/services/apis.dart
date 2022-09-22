// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nebat/models/models.dart';

class APIS {
  final String _apikey = 'nGFgz6bm5mpkvgOVdhCdU31WjIJHEbGAOEEahX3klSkxcnsmpj';
  final String _endpoint = 'https://api.plant.id/v2/identify';

  Future<List<Plant>> identifyPlant(String base64Image) async {
    List<String> images = [];
    List<Plant> plants = [];

    images.add(base64Image);
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
        List<dynamic> suggesstions = results['suggestions'];
        for (var suggesstion in suggesstions) {
          Map<String, dynamic> plant = suggesstion as Map<String, dynamic>;
          plants.add(Plant(
              id: plant['id'] as int,
              plantName: plant['plant_name'] as String,
              imagePath: results['images'][0]['url'] as String,
              images: [],
              suggestions: []));
        }

        return plants;
      } else {
        print('this is not plant');
        return plants;
      }
    } catch (e) {
      print(e);
      return plants;
    }
  }
}
