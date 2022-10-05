import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:nebat/services/apis.dart';
import 'package:nebat/services/providers.dart';

class DataMap {
  List<Map<String, dynamic>> = [{
    ""
  },{},{}];
 
 
}

@GenerateNiceMocks([MockSpec<DataMap>()])
void main() {
  group('serialization', () {
    DataMap data = DataMap();

    test('converts List<Map<String,dynamic>> to List<Plant>', () {
      plantMapsToModels(data.data);
    });
  });
  group('provider methods', () {
    IdentificationProvider provider = IdentificationProvider();

    // toBase64() method's test
    test('converts file to base64', () async {
      File file = File('assets/images/plant.png');
      expect(provider.toBase64(file), isA<String>());
      expect(provider.toBase64(file).length > 100, true);
    });
  });
  group('plant images functions ', () {
    PlantsAPI api = PlantsAPI();
    test('function returns html doc as a string', () async {
      String url = await api.getHTMLDoc('apple');
      expect(url.isNotEmpty, true);
      expect(url.contains('body'), true);
    });
    test('function returns a url string', () async {
      PlantsAPI api = PlantsAPI();
      String url = await api.getImageFromWeb('apple');
      expect(url.isNotEmpty, true);
    });
  });
}
