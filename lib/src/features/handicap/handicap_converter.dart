import 'package:savageapi/src/converter.dart';

import 'handicap_resource.dart';

class HandicapConverter extends Converter<HandicapResource> {
  const HandicapConverter();
  @override
  HandicapResource fromJson(Map<String, dynamic> json) {
    return HandicapResource.fromJson(json);
  }
}
