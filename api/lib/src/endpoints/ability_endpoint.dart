import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/core/endpoints/detail_endpoint.dart';
import 'package:savageapi/src/core/endpoints/paginated_endpoint.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';
import 'package:savageapi/src/models/ability_resource.dart';

class AbilityEndpoint extends BaseEndpoint<AbilityResource>
    with DetailEndpoint<AbilityResource>, PaginatedEndpoint<AbilityResource> {
  AbilityEndpoint(SavageClient client) : super(client);

  @override
  String get from => 'ability';
}
