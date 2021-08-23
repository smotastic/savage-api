import 'package:savageapi/src/models/ability_resource.dart';

abstract class Converter<T> {
  T fromJson(Map<String, dynamic> json);
}

class AbilityConverter extends Converter<AbilityResource> {
  @override
  AbilityResource fromJson(Map<String, dynamic> json) {
    return AbilityResource.fromJson(json);
  }
}

class ConverterFactory {
  final Map<Type, Converter> _converters = Map.unmodifiable(
    {
      AbilityResource: AbilityConverter(),
    },
  );

  Converter get<T>() => _converters[T]!;
}
