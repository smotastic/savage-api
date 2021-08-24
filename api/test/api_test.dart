import 'package:savageapi/savageapi.dart';
import 'package:test/test.dart';

void main() {
  test('Should use api', () async {
    final api = SavageApi(
        url: 'https://gtcalupnsgqauomddosz.supabase.co',
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyOTcxMjcwMywiZXhwIjoxOTQ1Mjg4NzAzfQ.38VOm9qgX_E1BTdky9XFgXhiaXghOajcpNABebEvEAs');
    final result = await api.ability().get(1);
    print(result);
  });
}
