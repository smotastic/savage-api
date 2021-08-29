import 'package:json_annotation/json_annotation.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

part 'ability_resource.g.dart';

@JsonSerializable()
class AbilityResource extends BaseResource {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String attribute;

  AbilityResource(this.id, this.name, this.description, this.attribute);

  factory AbilityResource.fromJson(Map<String, dynamic> json) {
    return _$AbilityResourceFromJson(json);
  }

  @override
  String toString() {
    return 'Ability: [id:$id, name:$name, description:$description, attribute:$attribute]';
  }
}
