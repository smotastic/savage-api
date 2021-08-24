import 'dart:convert';

import 'package:postgrest/postgrest.dart';
import 'package:savageapi/src/converter.dart';
import 'package:savageapi/src/builder/query_builder.dart';

abstract class SavageClient {
  Future<T> get<T>(String from,
      {String columns = '*', QueryFilterBuilder? filter});
}

class SavagePostgrestClient extends SavageClient {
  late PostgrestClient _client;
  final ConverterFactory _converterFactory;

  factory SavagePostgrestClient(
      {String? url,
      String? apiVersion,
      String? token,
      PostgrestClient? client,
      ConverterFactory? converterFactory}) {
    return SavagePostgrestClient._(
      client ??
          PostgrestClient('${url ?? ''}${apiVersion ?? ''}').auth(token ?? ''),
      converterFactory ?? ConverterFactory(),
    );
  }

  SavagePostgrestClient._(this._client, this._converterFactory);
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
    print(response);
    final json = jsonDecode(response.data);
    return _converterFactory.get<T>().fromJson(json) as T;
  }

  final Map<FilterOperator, String> _filterOperatorMap = {
    FilterOperator.eq: 'eq',
    FilterOperator.neq: 'neq',
    FilterOperator.lt: 'lt',
    FilterOperator.lte: 'lte',
    FilterOperator.gt: 'gt',
    FilterOperator.gte: 'gte',
    FilterOperator.like: 'like',
  };
}
