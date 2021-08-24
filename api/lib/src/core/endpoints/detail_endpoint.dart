import 'package:dartz/dartz.dart';
import 'package:savageapi/src/builder/query_builder.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';
import 'package:savageapi/src/core/failure.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

abstract class DetailEndpoint<T extends BaseResource>
    implements ClientProvider {
  String get from;
  String get idColumn => 'id';

  Future<Either<ApiFailure, T>> get(dynamic id) async {
    final result =
        await client.get<T>(from, filter: QueryFilterBuilder.eq(idColumn, id));
    return Right(result);
  }
}
