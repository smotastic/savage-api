import 'package:dartz/dartz.dart';
import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/core/failure.dart';
import 'package:savageapi/src/models/base_resource.dart';

abstract class BaseEndpoint<T extends BaseResource> {
  final SavageClient client;

  BaseEndpoint(this.client);
}

abstract class DetailEndpoint<T extends BaseResource> {
  Future<Either<ApiFailure, T>> get(dynamic id);
}

abstract class PaginatedEndpoint<T extends BaseResource> {
  // Future<Either<ApiFailure, Pagination>> page(num pageSize, num offset);
}
