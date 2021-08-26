import 'package:savageapi/savageapi.dart';
import 'package:test/test.dart';

void main() {
  final token = 'bla';
  test('Should use api supabase', () async {
    final api =
        SavageApi.supabase('https://gtcalupnsgqauomddosz.supabase.co', token);

    final result = await api.ability().get(1);
    final res = result.getOrElse(() => throw 0);
    print(res.name);
  }, skip: true);

  test('Should use detail api poistgres', () async {
    final api = SavageApi.postgrest('https://gtcalupnsgqauomddosz.supabase.co',
        token: token);

    final result = await api.ability().get(1);
    final res = result.getOrElse(() => throw 0);
    print(res);
  });

  test('Should use page api poistgres', () async {
    final api = SavageApi.postgrest('https://gtcalupnsgqauomddosz.supabase.co',
        token: token);

    final result = await api.ability().page(10, 0);
    final res = result.getOrElse(() => throw 0);
    res.forEach(print);
  });

  test('Should just find the names', () async {
    final api = SavageApi.postgrest('https://gtcalupnsgqauomddosz.supabase.co',
        token: token);

    final result = await api.ability().findAllNames();
    final res = result.getOrElse(() => throw 0);
    res.forEach(print);
  });
}
