import 'package:postgrest/postgrest.dart';
import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/converter.dart';
import 'package:savageapi/src/core/builder/builder.dart';
import 'package:savageapi/src/core/logger/logger.dart';

class SavagePostgrestClient extends SavageClient {
  late PostgrestClient _client;
  final ConverterFactory _converterFactory;

  factory SavagePostgrestClient(
      {String? url,
      String? apiVersion,
      String? token,
      PostgrestClient? client,
      ConverterFactory? converterFactory}) {
    final _token = token ?? '';
    return SavagePostgrestClient._(
      client ??
          PostgrestClient('${url ?? ''}${apiVersion ?? ''}',
              headers: {'apikey': _token}).auth(_token),
      converterFactory ?? ConverterFactory(),
    );
  }

  SavagePostgrestClient._(this._client, this._converterFactory);
  @override
  Future<List<T>> get<T>(QueryBuilder builder) async {
    var columns = '*';
    final selectOp = builder.retrieveOperation<SelectOperation>();
    if (selectOp != null) {
      columns = selectOp.columns;
    }

    final postgrestbuilder = _client.from(builder.from).select(columns);

    builder.retrieveFilter().forEach((filterOp) {
      postgrestbuilder.filter(
        filterOp.column,
        _filterOperatorMap[filterOp.operator]!,
        filterOp.value,
      );
    });

    final limitOp = builder.retrieveOperation<LimitOperation>();
    if (limitOp != null) {
      postgrestbuilder.limit(limitOp.limit);
    }
    final rangeOp = builder.retrieveOperation<RangeOperation>();
    if (rangeOp != null) {
      postgrestbuilder.range(rangeOp.from, rangeOp.to);
    }

    final orderOp = builder.retrieveOperation<OrderOperation>();
    if (orderOp != null) {
      postgrestbuilder.order(orderOp.column,
          ascending: orderOp.ascending, nullsFirst: orderOp.nullsFirst);
    }
    Logger.I.d(builder);
    final response = await postgrestbuilder.execute();
    if (response.error != null) {
      Logger.I.e(response.error!.message);
      return [];
    }
    final responseData = response.data as List<dynamic>;
    return responseData
        .map((json) => _converterFactory.get<T>().fromJson(json) as T)
        .toList();
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
