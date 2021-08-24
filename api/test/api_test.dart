import 'package:savageapi/savageapi.dart';
import 'package:test/test.dart';

void main() {
  test('Should use api supabase', () async {
    final api =
        SavageApi.supabase('https://gtcalupnsgqauomddosz.supabase.co', 'bla');

    final result = await api.ability().get(1);
    final res = result.getOrElse(() => throw 0);
    print(res.name);
  });

  test('Should use api poistgres', () async {
    final api = SavageApi.rest('https://gtcalupnsgqauomddosz.supabase.co',
        token: 'bla');

    final result = await api.ability().get(1);
    final res = result.getOrElse(() => throw 0);
    print(res.name);
  });
}
