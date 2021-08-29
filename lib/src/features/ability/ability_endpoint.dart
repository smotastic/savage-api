import 'package:dartz/dartz.dart';
import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/core/builder/builder.dart';
import 'package:savageapi/src/core/endpoints/detail_endpoint.dart';
import 'package:savageapi/src/core/endpoints/paginated_endpoint.dart';
import 'package:savageapi/src/core/endpoints/base_endpoint.dart';
import 'package:savageapi/src/core/failure.dart';
import 'package:savageapi/src/features/ability/ability_resource.dart';

class AbilityEndpoint extends BaseEndpoint<AbilityResource>
    with DetailEndpoint<AbilityResource>, PaginatedEndpoint<AbilityResource> {
  AbilityEndpoint(SavageClient client) : super(client);

  @override
  String get from => 'ability';

  Future<Either<ApiFailure, List<AbilityResource>>> findAllNames() async {
    final builder = QueryBuilder.from(from).select('name');
    final result = await client.get<AbilityResource>(builder);
    return Right(result);
  }
}
