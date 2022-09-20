// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:html';

import 'package:nebat/constants.dart';

import 'package:http/http.dart' as http;
import 'package:nebat/models/models.dart';

class APIS {
  Future<void> identifyPlant() async {
    String apikey = 'nGFgz6bm5mpkvgOVdhCdU31WjIJHEbGAOEEahX3klSkxcnsmpj';
    final base64Str = window.btoa(raw);
    List<dynamic> i = [raw, raw];
    Map<String, dynamic> body = {'images': i};
    try {
      http.Response response = await http.post(
        Uri.parse('https://api.plant.id/v2/identify'),
        headers: {
          'Accept': '*/*',
          'Access-Control-Allow-Origin': '*',
          'Api-Key': apikey,
        },
        body: jsonEncode(body),
      );
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
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
