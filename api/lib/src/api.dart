import 'package:savageapi/src/endpoints/ability_endpoint.dart';

import 'client.dart';

class SavageApi implements SavageApiCalls {
  final SavageClient client;

  SavageApi(
      {required String url, String apiVersion = '/rest/v1', String token = ''})
      : client = SavagePostgrestClient(
            url: url, apiVersion: apiVersion, token: token);

  @override
  AbilityEndpoint ability() {
    return AbilityEndpoint(client);
  }
}

abstract class SavageApiCalls {
  AbilityEndpoint ability();
}
