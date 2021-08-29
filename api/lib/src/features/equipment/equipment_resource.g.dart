// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentResource _$EquipmentResourceFromJson(Map<String, dynamic> json) =>
    EquipmentResource(
      json['id'] as int? ?? 0,
      json['name'] as String,
      json['description'] as String? ?? '',
      json['damage'] as String? ?? '',
      json['requirements'] as String? ?? '',
      json['type'] as String? ?? '',
      json['cost'] as String? ?? '',
      json['weight'] as String? ?? '',
      json['firerate'] as String? ?? '',
      json['range'] as String? ?? '',
      json['magazinesize'] as String? ?? '',
      json['paradebonus'] as String? ?? '',
    );

Map<String, dynamic> _$EquipmentResourceToJson(EquipmentResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'damage': instance.damage,
      'requirements': instance.requirements,
      'type': instance.type,
      'cost': instance.cost,
      'weight': instance.weight,
      'firerate': instance.firerate,
      'range': instance.range,
      'magazinesize': instance.magazinesize,
      'paradebonus': instance.paradebonus,
    };
