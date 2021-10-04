import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/core/endpoints/detail_endpoint.dart';
import 'package:savageapi/src/core/endpoints/paginated_endpoint.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';

import 'handicap.dart';

class HandicapEndpoint extends BaseEndpoint<HandicapResource>
    with DetailEndpoint<HandicapResource>, PaginatedEndpoint<HandicapResource> {
  HandicapEndpoint(SavageClient client) : super(client);

  @override
  String get from => 'handicap';
}
