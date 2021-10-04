import 'package:savageapi/src/converter.dart';
import 'package:savageapi/src/core/clients/postgrest_client.dart';
import 'package:savageapi/src/core/clients/supabase_client.dart';
import 'package:savageapi/src/features/handicap/handicap_endpoint.dart';
import 'client.dart';
import 'features/ability/ability.dart';
import 'features/equipment/equipment.dart';

class SavageApi implements SavageApiCalls {
  final SavageClient client;

  factory SavageApi.postgrest(
      {String url = 'https://gtcalupnsgqauomddosz.supabase.co',
      String apiVersion = '/rest/v1',
      String token = '',
      ConverterFactory? converterFactory}) {
    final _client = SavagePostgrestClient(
        url: url,
        apiVersion: apiVersion,
        token: token,
        converterFactory: converterFactory);
    return SavageApi(_client);
  }

  /// @deprecrated use [SavageApi.postgrest]
  @deprecated
  factory SavageApi.supabase(String url, String key) {
    final _client = SavageSupabaseClient(url, key);
    return SavageApi(_client);
  }

  SavageApi(this.client);

  @override
  AbilityEndpoint ability() {
    return AbilityEndpoint(client);
  }

  @override
  EquipmentEndpoint equipment() {
    return EquipmentEndpoint(client);
  }

  @override
  HandicapEndpoint handicap() {
    return HandicapEndpoint(client);
  }
}

abstract class SavageApiCalls {
  AbilityEndpoint ability();
  EquipmentEndpoint equipment();
  HandicapEndpoint handicap();
}
