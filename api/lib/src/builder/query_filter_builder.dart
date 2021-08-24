import 'package:equatable/equatable.dart';

abstract class QueryFilterBuilder {
  const QueryFilterBuilder();

  factory QueryFilterBuilder.instance() {
    return const _QueryFilterBuilder();
  }
  factory QueryFilterBuilder.eq(String column, dynamic value) {
    const filter = _QueryFilterBuilder();
    return filter.eq(column, value);
  }

  QueryFilterBuilder eq(String column, dynamic value);
  QueryFilterBuilder neq(String column, dynamic value);
  QueryFilterBuilder lt(String column, dynamic value);
  QueryFilterBuilder lte(String column, dynamic value);
  QueryFilterBuilder gt(String column, dynamic value);
  QueryFilterBuilder gte(String column, dynamic value);
  QueryFilterBuilder like(String column, String pattern);

  Set<FilterOperation> retrieveFilter();
}

class _QueryFilterBuilder extends QueryFilterBuilder {
  final Set<FilterOperation> _filter = const {};
  const _QueryFilterBuilder();

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
