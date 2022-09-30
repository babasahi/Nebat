import 'package:flutter_test/flutter_test.dart';
import 'package:nebat/services/apis.dart';

void main() {
  group('provider tests', () {
    test('function returns html doc as string', () async {
      PlantsAPI api = PlantsAPI();
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
