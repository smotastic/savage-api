import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

abstract class BaseEndpoint<T extends BaseResource> implements ClientProvider {
  final SavageClient _client;

  BaseEndpoint(this._client);

  @override
  SavageClient get client => _client;
}

abstract class ClientProvider {
  SavageClient get client;
}
