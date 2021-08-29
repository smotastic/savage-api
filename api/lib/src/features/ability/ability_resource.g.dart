// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilityResource _$AbilityResourceFromJson(Map<String, dynamic> json) =>
    AbilityResource(
      json['id'] as int? ?? 0,
      json['name'] as String? ?? '',
      json['description'] as String? ?? '',
      json['attribute'] as String? ?? '',
    );

Map<String, dynamic> _$AbilityResourceToJson(AbilityResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'attribute': instance.attribute,
    };
