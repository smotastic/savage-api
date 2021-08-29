import 'package:savageapi/src/converter.dart';

import 'equipment_resource.dart';

class EquipmentConverter extends Converter<EquipmentResource> {
  const EquipmentConverter();
  @override
  EquipmentResource fromJson(Map<String, dynamic> json) {
    return EquipmentResource.fromJson(json);
  }
}
