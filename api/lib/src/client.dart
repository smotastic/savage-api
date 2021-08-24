import 'package:savageapi/src/builder/query_builder.dart';

abstract class SavageClient {
  Future<List<T>> get<T>(String from,
      {String columns = '*', QueryFilterBuilder? filter});
}
