import 'dart:convert';

import 'package:postgrest/postgrest.dart';
import 'package:savageapi/src/converter.dart';

abstract class SavageClient {
  Future<T> get<T>(String from,
      {String columns = '*', Map<String, String> eq = const {}});
}

class SavageRemoteClient extends SavageClient {
  final String _url;
  final String _apiVersion;
  late PostgrestClient _client;
  final ConverterFactory _converterFactory;

  factory SavageRemoteClient(
      {String? url,
      String? apiVersion,
      PostgrestClient? client,
      ConverterFactory? converterFactory}) {
    return SavageRemoteClient._(
      url ?? '',
      apiVersion ?? '',
      client ?? PostgrestClient(url ?? ''),
      converterFactory ?? ConverterFactory(),
    );
  }

  SavageRemoteClient._(
      this._url, this._apiVersion, this._client, this._converterFactory);

  @override
  Future<T> get<T>(String from,
      {String columns = '*', Map<String, String> eq = const {}}) async {
    final builder = _client.from(from).select(columns);
    // builder.eq(column, value)
    // builder.filter(column, operator, value)
    final response = await builder.execute();
    final json = jsonDecode(response.data);
    return _converterFactory.get<T>().fromJson(json) as T;
  }
}
