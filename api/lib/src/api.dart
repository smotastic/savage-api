import 'package:savageapi/src/endpoints/ability_endpoint.dart';

import 'client.dart';

class SavageApi implements SavageApiCalls {
  final SavageClient client;

  SavageApi({required url, apiVersion = '/api/v2/'})
      : client = SavagePostgrestClient(url: url, apiVersion: apiVersion);

  @override
  AbilityEndpoint ability() {
    return AbilityEndpoint(client);
  }
}

abstract class SavageApiCalls {
  AbilityEndpoint ability();
}
