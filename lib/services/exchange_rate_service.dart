import 'dart:convert';

import 'package:http/http.dart' as http;

class ExchangeRateService {
  Future<String> getLatestExchangeRates() async {
    var client = http.Client();
    try {
      var url =
      Uri.https('api.exchangerate.host', '/latest');
      var response = await client.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to get http');
      }
    } finally {
      client.close();
    }
  }
}