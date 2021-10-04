import 'package:json_annotation/json_annotation.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

part 'handicap_resource.g.dart';

@JsonSerializable()
class HandicapResource extends BaseResource {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String type;

  HandicapResource(this.id, this.name, this.description, this.type);

  factory HandicapResource.fromJson(Map<String, dynamic> json) {
    return _$HandicapResourceFromJson(json);
  }

  @override
  String toString() {
    return 'HandicapResource: [id:$id, name:$name, description:$description, type:$type]';
  }
}
