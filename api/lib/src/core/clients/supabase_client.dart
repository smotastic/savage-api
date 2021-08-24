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
  Future<List<T>> get<T>(String from,
      {String columns = '*', QueryFilterBuilder? filter}) async {
    final response = await _client.from(from).select(columns).execute();
    final responseData = response.data as List<dynamic>;
    return responseData
        .map((json) => _converterFactory.get<T>().fromJson(json) as T)
        .toList();
  }
}
