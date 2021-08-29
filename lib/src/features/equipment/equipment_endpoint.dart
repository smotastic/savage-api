import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/core/endpoints/detail_endpoint.dart';
import 'package:savageapi/src/core/endpoints/paginated_endpoint.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';

import 'equipment.dart';

class EquipmentEndpoint extends BaseEndpoint<EquipmentResource>
    with
        DetailEndpoint<EquipmentResource>,
        PaginatedEndpoint<EquipmentResource> {
  EquipmentEndpoint(SavageClient client) : super(client);

  @override
  String get from => 'equipment';
}
