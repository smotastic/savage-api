import 'package:savageapi/src/builder/query_builder.dart';
import 'package:savageapi/src/client.dart';
import 'package:savageapi/src/converter.dart';
import 'package:supabase/supabase.dart';

class SavageSupabaseClient extends SavageClient {
  late SupabaseClient _client;
  final ConverterFactory _converterFactory;

  factory SavageSupabaseClient(String url, String key) {
    return SavageSupabaseClient._(SupabaseClient(url, key), ConverterFactory());
  }

  SavageSupabaseClient._(this._client, this._converterFactory);

  @override
  Future<List<T>> get<T>(QueryBuilder builder) async {
    final response = await _client.from(builder.from).select().execute();
    final responseData = response.data as List<dynamic>;
    return responseData
        .map((json) => _converterFactory.get<T>().fromJson(json) as T)
        .toList();
  }
}
