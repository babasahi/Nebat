import 'package:flutter_test/flutter_test.dart';
import 'package:nebat/services/apis.dart';

void main() {
  group('provider tests', () {
    test('function returns a string', () async {
      PlantsAPI api = PlantsAPI();
      String url = await api.getImageFromWeb('apple');
      expect(url.isNotEmpty, true);
    });
  });
}
