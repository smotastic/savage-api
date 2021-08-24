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
  QueryFilterBuilder lt(String column, dynamic value);
  QueryFilterBuilder gt(String column, dynamic value);
  QueryFilterBuilder like(String column, dynamic value);

  Set<FilterOperation> retrieveFilter();
}

class _QueryFilterBuilder extends QueryFilterBuilder {
  final Set<FilterOperation> filter = const {};
  const _QueryFilterBuilder();

  @override
  QueryFilterBuilder eq(String column, value) {
    _addFilter(column, FilterOperator.eq, value);
    return this;
  }

  @override
  QueryFilterBuilder gt(String column, value) {
    _addFilter(column, FilterOperator.gt, value);
    return this;
  }

  @override
  QueryFilterBuilder like(String column, value) {
    _addFilter(column, FilterOperator.like, value);
    throw UnimplementedError();
  }

  @override
  QueryFilterBuilder lt(String column, value) {
    _addFilter(column, FilterOperator.lt, value);
    throw UnimplementedError();
  }

  @override
  Set<FilterOperation> retrieveFilter() {
    return filter;
  }

  void _addFilter(String column, FilterOperator operator, dynamic value) {
    filter.add(FilterOperation(column, operator, value));
  }
}

enum FilterOperator { eq, gt, lt, like }

class FilterOperation extends Equatable {
  final String column;
  final FilterOperator operator;
  final dynamic value;

  FilterOperation(this.column, this.operator, this.value);

  @override
  List<Object?> get props => [column, operator, value];
}
