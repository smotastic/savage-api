import 'package:json_annotation/json_annotation.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

part 'equipment_resource.g.dart';

@JsonSerializable()
class EquipmentResource extends BaseResource {
  @JsonKey(defaultValue: 0)
  final int id;
  final String name;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String damage;
  @JsonKey(defaultValue: '')
  final String requirements;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String cost;
  @JsonKey(defaultValue: '')
  final String weight;
  @JsonKey(defaultValue: '')
  final String firerate;
  @JsonKey(defaultValue: '')
  final String range;
  @JsonKey(defaultValue: '')
  final String magazinesize;
  @JsonKey(defaultValue: '')
  final String paradebonus;

  factory EquipmentResource.fromJson(Map<String, dynamic> json) {
    return _$EquipmentResourceFromJson(json);
  }

  EquipmentResource(
      this.id,
      this.name,
      this.description,
      this.damage,
      this.requirements,
      this.type,
      this.cost,
      this.weight,
      this.firerate,
      this.range,
      this.magazinesize,
      this.paradebonus);

  @override
  String toString() {
    return 'Equipment: [id:$id, name:$name, description:$description, damage:$damage, requirements:$requirements, type:$type, cost:$cost, weight:$weight, firerate:$firerate, range:$range, magazinesize:$magazinesize, paradebonus:$paradebonus]';
  }
}
