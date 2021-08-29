import 'package:savageapi/savageapi.dart';
import 'package:savageapi/src/converter.dart';
import 'package:test/scaffolding.dart';

import '../config.dart';
import 'ability_entry_api.dart';
import 'ability_entry_resource.dart';

final Map<Type, Converter> additionalConverter = {
  AbilityEntryResource: AbilityEntryConverter(),
};

void main() {
  test('should use custom api', () async {
    final api = SavageApi.postgrest(
        token: token, converterFactory: ConverterFactory(additionalConverter));
    final result = await api.abilityEntry().page(10, 0);
    final customAbilities = result.orElse(() => throw 0);
    print(customAbilities);
  });
}
