import 'package:savageapi/src/models/ability_resource.dart';

abstract class Converter<T> {
  const Converter();
  T fromJson(Map<String, dynamic> json);
}

class AbilityConverter extends Converter<AbilityResource> {
  const AbilityConverter();
  @override
  AbilityResource fromJson(Map<String, dynamic> json) {
    return AbilityResource.fromJson(json);
  }
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
