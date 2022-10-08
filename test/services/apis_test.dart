import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebat/services/apis.dart';
import 'package:nebat/services/providers.dart';

void main() {
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
