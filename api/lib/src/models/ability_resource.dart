import 'package:json_annotation/json_annotation.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

part 'ability_resource.g.dart';

@JsonSerializable()
class AbilityResource extends BaseResource {
  @JsonKey(defaultValue: 0)
  final int id;
  final String name;

  AbilityResource(this.id, this.name);

  factory AbilityResource.fromJson(Map<String, dynamic> json) {
    return _$AbilityResourceFromJson(json);
  }

  @override
  String toString() {
    return 'Ability: [id:$id, name:$name]';
  }
}
