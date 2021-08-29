import 'package:dartz/dartz.dart';
import 'package:savageapi/src/builder/query_builder.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';
import 'package:savageapi/src/core/failure.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

abstract class DetailEndpoint<T extends BaseResource>
    implements ClientProvider, ColumnsProvider {
  String get from;
  String get idColumn => 'id';

  Future<Either<ApiFailure, T>> get(dynamic id, {String? columns}) async {
    final builder = QueryBuilder.from(from);
    builder.select(columns ?? this.columns).eq(idColumn, id);
    final result = await client.get<T>(builder);
    if (result.isNotEmpty) {
      return Right(result.first);
    }
    return Left(UnknownApiFailure());
  }
}
