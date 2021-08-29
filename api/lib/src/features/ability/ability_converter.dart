import 'package:savageapi/src/converter.dart';

import 'ability_resource.dart';

class AbilityConverter extends Converter<AbilityResource> {
  const AbilityConverter();
  @override
  AbilityResource fromJson(Map<String, dynamic> json) {
    return AbilityResource.fromJson(json);
  }
}
