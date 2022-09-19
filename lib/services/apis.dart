import 'package:nebat/models/models.dart';

import 'package:http/http.dart' as http;

class APIS {
  Future<Plant> identifyPlant() async {
    String apikey = 'nGFgz6bm5mpkvgOVdhCdU31WjIJHEbGAOEEahX3klSkxcnsmpj';
    String uri = 'https://plant.id/api/v2';
    Uri url = Uri(
      scheme: 'http',
      host: 'my-api.plantnet.org',
      path: uri,
    );
    try {
      http.Response response = await http.get(
        url,
      );
      print('this is code : ${response.body}');
    } catch (e) {
      print(e);
    }

    return Plant(name: 'name', imagePath: 'imagePath');
  }
}
