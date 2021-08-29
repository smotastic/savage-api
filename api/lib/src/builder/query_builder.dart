import 'package:savageapi/src/builder/query_filter_builder.dart';
import 'package:savageapi/src/builder/query_transform_builder.dart';

class QueryBuilder
    with _QueryFilterBuilderDelegate, _QueryTransformBuilderDelegate {
  final String _from;
  final QueryFilterBuilder _filterBuilder;
  final QueryTransformBuilder _transformBuilder;

  String get from => _from;
  @override
  QueryFilterBuilder get filterDelegate => _filterBuilder;
  @override
  QueryTransformBuilder get transformDelegate => _transformBuilder;
  @override
  QueryBuilder get _this => this;

  QueryBuilder._(this._from, this._filterBuilder, this._transformBuilder);

  factory QueryBuilder.from(String from) {
    return QueryBuilder._(
        from, QueryFilterBuilder.instance(), QueryTransformBuilder.instance());
  }

  @override
  String toString() {
    return 'Filter: $filterDelegate; Transform: $transformDelegate';
  }
}

abstract class _QueryTransformBuilderDelegate
    implements QueryTransformBuilderDelegate<QueryBuilder> {
  QueryTransformBuilder get transformDelegate;
  QueryBuilder get _this;
  @override
  QueryBuilder limit(int limit) {
    transformDelegate.limit(limit);
    return _this;
  }

  @override
  QueryBuilder order(String column,
      {bool ascending = false, bool nullsFirst = false}) {
    transformDelegate.order(column,
        ascending: ascending, nullsFirst: nullsFirst);
    return _this;
  }

  @override
  QueryBuilder range(int from, int to) {
    transformDelegate.range(from, to);
    return _this;
  }

  @override
  QueryBuilder select([String columns = '*']) {
    transformDelegate.select(columns);
    return _this;
  }

  @override
  V? retrieveOperation<V extends TransformOperation>() {
    return transformDelegate.retrieveOperation<V>();
  }
}

abstract class _QueryFilterBuilderDelegate
    implements QueryFilterBuilderDelegate<QueryBuilder> {
  QueryFilterBuilder get filterDelegate;
  QueryBuilder get _this;

  @override
  QueryBuilder eq(String column, value) {
    filterDelegate.eq(column, value);
    return _this;
  }

  @override
  QueryBuilder gt(String column, value) {
    filterDelegate.gt(column, value);
    return _this;
  }

  @override
  QueryBuilder gte(String column, value) {
    filterDelegate.gte(column, value);
    return _this;
  }

  @override
  QueryBuilder like(String column, String pattern) {
    filterDelegate.like(column, pattern);
    return _this;
  }

  @override
  QueryBuilder lt(String column, value) {
    filterDelegate.lt(column, value);
    return _this;
  }

  @override
  QueryBuilder lte(String column, value) {
    filterDelegate.lte(column, value);
    return _this;
  }

  @override
  QueryBuilder neq(String column, value) {
    filterDelegate.neq(column, value);
    return _this;
  }

  @override
  Set<FilterOperation> retrieveFilter() {
    return filterDelegate.retrieveFilter();
  }
}
