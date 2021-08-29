import 'package:savageapi/savageapi.dart';

import 'ability_entry_resource.dart';

extension CustomSavageApi on SavageApi {
  AbilityEntryEndpoint abilityEntry() {
    return AbilityEntryEndpoint(client);
  }
}

class AbilityEntryEndpoint extends BaseEndpoint<AbilityEntryResource>
    with PaginatedEndpoint<AbilityEntryResource> {
  AbilityEntryEndpoint(SavageClient client) : super(client);

  @override
  String get from => 'ability';

  @override
  String get columns => 'name';
}

class AbilityEntryConverter extends Converter<AbilityEntryResource> {
  @override
  AbilityEntryResource fromJson(Map<String, dynamic> json) {
    return AbilityEntryResource.fromJson(json);
  }
}
