import 'dart:convert';
import 'package:currency_coverter/modals/currency_converter.dart';
import 'package:http/http.dart' as http;

class CurrencyConvertApiHelper {
  CurrencyConvertApiHelper._();

  static final CurrencyConvertApiHelper currencyConvertApiHelper = CurrencyConvertApiHelper._();

  Future<CurrencyConvert?> currencyConvertorAPI(
      {required String from, required String to}) async {
    String url =
        "https://api.exchangerate.host/convert?from=$from&to=$to&amount=1";

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      CurrencyConvert currencyConvert =
          CurrencyConvert.fromMap(json: decodedData);
      return currencyConvert;
    }
    return null;
  }
}
