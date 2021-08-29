import 'package:dartz/dartz.dart';
import 'package:savageapi/src/builder/builder.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';
import 'package:savageapi/src/core/failure.dart';
import 'package:savageapi/src/core/models/base_resource.dart';

abstract class PaginatedEndpoint<T extends BaseResource>
    implements ClientProvider, ColumnsProvider {
  String get from;

  Future<Either<ApiFailure, List<T>>> page(num pageSize, num offset,
      {String? columns}) async {
    final result = await client.get<T>(QueryBuilder.from(from)
        .select(columns ?? this.columns)
        .range(offset.toInt(), (offset.toInt() + pageSize.toInt()) - 1));
    return Right(result);
  }
}
