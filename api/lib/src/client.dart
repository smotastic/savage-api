import 'dart:convert';

import 'package:postgrest/postgrest.dart';
import 'package:savageapi/src/converter.dart';
import 'package:savageapi/src/builder/query_builder.dart';

abstract class SavageClient {
  Future<T> get<T>(String from,
      {String columns = '*', QueryFilterBuilder? filter});
}

class SavagePostgrestClient extends SavageClient {
  final String _url;
  final String _apiVersion;
  late PostgrestClient _client;
  final ConverterFactory _converterFactory;

  factory SavagePostgrestClient(
      {String? url,
      String? apiVersion,
      PostgrestClient? client,
      ConverterFactory? converterFactory}) {
    return SavagePostgrestClient._(
      url ?? '',
      apiVersion ?? '',
      client ?? PostgrestClient(url ?? ''),
      converterFactory ?? ConverterFactory(),
    );
  }

  SavagePostgrestClient._(
      this._url, this._apiVersion, this._client, this._converterFactory);
  // const f = const QueryFilterBuilder.empty;
  @override
  Future<T> get<T>(String from,
      {String columns = '*', QueryFilterBuilder? filter}) async {
    filter ??= QueryFilterBuilder.instance();
    final builder = _client.from(from).select(columns);

    filter.retrieveFilter().forEach((filterOp) {
      builder.filter(
        filterOp.column,
        _filterOperatorMap[filterOp.operator]!,
        filterOp.value,
      );
    });

    final response = await builder.execute();
    final json = jsonDecode(response.data);
    return _converterFactory.get<T>().fromJson(json) as T;
  }

  final Map<FilterOperator, String> _filterOperatorMap = {
    FilterOperator.eq: 'eq',
    FilterOperator.lt: 'lt',
    FilterOperator.gt: 'gt',
    FilterOperator.like: 'like',
  };
}
