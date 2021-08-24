import 'package:json_annotation/json_annotation.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

part 'ability_resource.g.dart';

@JsonSerializable()
class AbilityResource extends BaseResource {
  final String name;

  AbilityResource(this.name);

  factory AbilityResource.fromJson(Map<String, dynamic> json) {
    return _$AbilityResourceFromJson(json);
  }
}
