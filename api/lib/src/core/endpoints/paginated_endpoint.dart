import 'package:dartz/dartz.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';
import 'package:savageapi/src/core/failure.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

abstract class PaginatedEndpoint<T extends BaseResource>
    implements ClientProvider {
  String get from;
  Future<Either<ApiFailure, int>> page(num pageSize, num offset,
      {String columns = '*'}) async {
    // client.get(from, columns: columns);
    return Right(1);
  }
}
