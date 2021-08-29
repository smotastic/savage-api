import 'package:savageapi/src/api.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../config.dart';

void main() {
  final api = SavageApi.postgrest(token: token);

  group('Should find abilities for api', () {
    test('when detail', () async {
      final result = await api.ability().get(1);
      final res = result.getOrElse(() => throw 0);

      expect(res, isNotNull);
      expect(res.id, isNotNull);
    });

    test('when page', () async {
      final result = await api.ability().page(10, 0);
      final res = result.getOrElse(() => throw 0);

      expect(res, hasLength(10));
    });

    test('when just finding names', () async {
      final result = await api.ability().findAllNames();
      final res = result.getOrElse(() => throw 0);
      for (var ability in res) {
        expect(ability.id, equals(0),
            reason:
                'Id should not have been requested and should be default value 0');
        expect(ability.name, isNotNull);
      }
    });
  });
}
