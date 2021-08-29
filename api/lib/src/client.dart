import 'core/builder/builder.dart';

abstract class SavageClient {
  Future<List<T>> get<T>(QueryBuilder builder);
}
