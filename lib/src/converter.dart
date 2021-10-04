import 'features/ability/ability.dart';
import 'features/equipment/equipment.dart';
import 'features/handicap/handicap.dart';

abstract class Converter<T> {
  const Converter();
  T fromJson(Map<String, dynamic> json);
}

const Map<Type, Converter> _defaultConverters = {
  AbilityResource: AbilityConverter(),
  EquipmentResource: EquipmentConverter(),
  HandicapResource: HandicapConverter(),
};

class ConverterFactory {
  late Map<Type, Converter> _converters;
  ConverterFactory([Map<Type, Converter>? additionalConverters]) {
    _converters = {..._defaultConverters, ...additionalConverters ?? {}};
  }

  Converter get<T>() => _converters[T]!;
}
