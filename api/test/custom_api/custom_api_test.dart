import 'package:savageapi/savageapi.dart';
import 'package:savageapi/src/converter.dart';
import 'package:test/scaffolding.dart';

import 'ability_entry_api.dart';
import 'ability_entry_resource.dart';

final Map<Type, Converter> additionalConverter = {
  AbilityEntryResource: AbilityEntryConverter(),
};

final String token = 'bla';

void main() {
  test('should use custom api', () async {
    final api = SavageApi.postgrest(
        token: token, converterFactory: ConverterFactory(additionalConverter));
    final result = await api.abilityEntry().page(10, 0, columns: 'name');
    final customAbilities = result.orElse(() => throw 0);
    print(customAbilities);
  });
}
