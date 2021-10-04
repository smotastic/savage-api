// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handicap_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandicapResource _$HandicapResourceFromJson(Map<String, dynamic> json) =>
    HandicapResource(
      json['id'] as int? ?? 0,
      json['name'] as String? ?? '',
      json['description'] as String? ?? '',
      json['type'] as String? ?? '',
    );

Map<String, dynamic> _$HandicapResourceToJson(HandicapResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
    };
