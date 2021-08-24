import 'package:dartz/dartz.dart';
import 'package:savageapi/src/builder/query_builder.dart';
import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/core/failure.dart';
import 'package:savageapi/src/endpoints/base_endpoint.dart';
import 'package:savageapi/src/models/ability_resource.dart';

class AbilityEndpoint extends BaseEndpoint<AbilityResource>
    implements DetailEndpoint<AbilityResource> {
  AbilityEndpoint(SavageClient client) : super(client);

  @override
  Future<Either<ApiFailure, AbilityResource>> get(dynamic id) async {
    final result = await client.get<AbilityResource>('ability',
        filter: QueryFilterBuilder.eq('id', id));
    return Right(result);
  }
}
