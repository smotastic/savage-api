import 'package:json_annotation/json_annotation.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

part 'ability_entry_resource.g.dart';

@JsonSerializable()
class AbilityEntryResource extends BaseResource {
  final String name;

  AbilityEntryResource(this.name);

  factory AbilityEntryResource.fromJson(Map<String, dynamic> json) {
    return _$AbilityEntryResourceFromJson(json);
  }

  @override
  String toString() {
    return 'AbilityEntry: [name:$name]';
  }
}
