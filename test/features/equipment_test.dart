import 'package:savageapi/src/api.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../config.dart';

void main() {
  final api = SavageApi.postgrest(token: token);

  group('Should find equipment for api', () {
    test('when detail', () async {
      final result = await api.equipment().get(1);
      final res = result.getOrElse(() => throw 0);

      expect(res, isNotNull);
      expect(res.id, isNotNull);
    });

    test('when page', () async {
      final result = await api.equipment().page(10, 0);
      final res = result.getOrElse(() => throw 0);

      expect(res, hasLength(10));
    });
  });
}
