import 'package:savageapi/src/builder/query_filter_builder.dart';
import 'package:savageapi/src/builder/query_transform_builder.dart';

class QueryBuilder {
  final String _from;
  final QueryFilterBuilder _filterBuilder;
  final QueryTransformBuilder _transformBuilder;

  QueryFilterBuilder get filterBuilder => _filterBuilder;
  QueryTransformBuilder get transformBuilder => _transformBuilder;
  String get from => _from;

  QueryBuilder._(this._from, this._filterBuilder, this._transformBuilder);

  factory QueryBuilder.from(String from) {
    return QueryBuilder._(
        from, QueryFilterBuilder.instance(), QueryTransformBuilder.instance());
  }

  QueryFilterBuilder select([String columns = '*']) {
    _transformBuilder.select(columns);
    return _filterBuilder;
  }
}
