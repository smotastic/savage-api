import 'package:savageapi/src/features/ability/ability_resource.dart';

import 'features/ability/ability_converter.dart';

abstract class Converter<T> {
  const Converter();
  T fromJson(Map<String, dynamic> json);
}

const Map<Type, Converter> _defaultConverters = {
  AbilityResource: AbilityConverter(),
};

class ConverterFactory {
  late Map<Type, Converter> _converters;
  ConverterFactory([Map<Type, Converter>? additionalConverters]) {
    _converters = {..._defaultConverters, ...additionalConverters ?? {}};
  }

  Converter get<T>() => _converters[T]!;
}
