import 'package:equatable/equatable.dart';

abstract class QueryFilterBuilderDelegate<T> {
  T eq(String column, dynamic value);
  T neq(String column, dynamic value);
  T lt(String column, dynamic value);
  T lte(String column, dynamic value);
  T gt(String column, dynamic value);
  T gte(String column, dynamic value);
  T like(String column, String pattern);

  Set<FilterOperation> retrieveFilter();
}

abstract class QueryFilterBuilder
    implements QueryFilterBuilderDelegate<QueryFilterBuilder> {
  QueryFilterBuilder();

  static QueryFilterBuilder instance() {
    return _QueryFilterBuilder();
  }
}

class _QueryFilterBuilder extends QueryFilterBuilder {
  final Set<FilterOperation> _filter = {};
  _QueryFilterBuilder();

  @override
  QueryFilterBuilder eq(String column, value) {
    _addFilter(column, FilterOperator.eq, value);
    return this;
  }

  @override
  QueryFilterBuilder neq(String column, value) {
    _addFilter(column, FilterOperator.neq, value);
    return this;
  }

  @override
  QueryFilterBuilder gt(String column, value) {
    _addFilter(column, FilterOperator.gt, value);
    return this;
  }

  @override
  QueryFilterBuilder gte(String column, value) {
    _addFilter(column, FilterOperator.gte, value);
    return this;
  }

  @override
  QueryFilterBuilder lt(String column, value) {
    _addFilter(column, FilterOperator.lt, value);
    return this;
  }

  @override
  QueryFilterBuilder lte(String column, value) {
    _addFilter(column, FilterOperator.lte, value);
    return this;
  }

  @override
  QueryFilterBuilder like(String column, String pattern) {
    _addFilter(column, FilterOperator.like, pattern);
    return this;
  }

  @override
  Set<FilterOperation> retrieveFilter() {
    return _filter;
  }

  void _addFilter(String column, FilterOperator operator, dynamic value) {
    _filter.add(FilterOperation(column, operator, value));
  }
}

enum FilterOperator { eq, neq, gt, gte, lt, lte, like }

class FilterOperation extends Equatable {
  final String column;
  final FilterOperator operator;
  final dynamic value;

  FilterOperation(this.column, this.operator, this.value);

  @override
  List<Object?> get props => [column, operator, value];
}
