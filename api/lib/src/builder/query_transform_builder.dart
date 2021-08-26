import 'package:equatable/equatable.dart';

abstract class QueryTransformBuilderDelegate<T> {
  T limit(int limit);
  T range(int from, int to);
  T select([String columns = '*']);
  T order(String column, {bool ascending = false, bool nullsFirst = false});

  V? retrieveOperation<V extends TransformOperation>();
}

abstract class QueryTransformBuilder
    implements QueryTransformBuilderDelegate<QueryTransformBuilder> {
  const QueryTransformBuilder();

  factory QueryTransformBuilder.instance() {
    return _QueryTransformBuilder();
  }
}

class _QueryTransformBuilder extends QueryTransformBuilder {
  final Set<TransformOperation> operations = {};

  @override
  QueryTransformBuilder limit(int limit) {
    _addTransform(LimitOperation(limit));
    return this;
  }

  @override
  QueryTransformBuilder order(String column,
      {bool ascending = false, bool nullsFirst = false}) {
    _addTransform(OrderOperation(column, ascending, nullsFirst));
    return this;
  }

  @override
  QueryTransformBuilder range(int from, int to) {
    _addTransform(RangeOperation(from, to));
    return this;
  }

  @override
  QueryTransformBuilder select([String columns = '*']) {
    _addTransform(SelectOperation(columns));
    return this;
  }

  void _addTransform(TransformOperation operation) {
    operations.add(operation);
  }

  @override
  T? retrieveOperation<T extends TransformOperation>() {
    final found = operations.whereType<T>();
    if (found.isNotEmpty) {
      return found.first;
    }
    return null;
  }
}

abstract class TransformOperation extends Equatable {}

class LimitOperation extends TransformOperation {
  final int _limit;
  int get limit => _limit;

  LimitOperation(this._limit);
  @override
  List<Object?> get props => [_limit];
}

class SelectOperation extends TransformOperation {
  final String _columns;
  String get columns => _columns;

  SelectOperation(this._columns);

  @override
  List<Object?> get props => [_columns];
}

class RangeOperation extends TransformOperation {
  final int from;
  final int to;

  RangeOperation(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}

class OrderOperation extends TransformOperation {
  final String column;
  final bool ascending;
  final bool nullsFirst;

  OrderOperation(this.column, this.ascending, this.nullsFirst);

  @override
  List<Object?> get props => [column, ascending, nullsFirst];
}
