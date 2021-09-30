import 'dart:convert';

import 'package:http/http.dart' as http;

class CoinPricesService {
  var top5CoinPrices = new Map<String, double>();

  Future<Map<String, double>> getTop5Prices() async {
    var client = http.Client();
    try {
      final Map<String, double> myList = new Map();
      var url =
          Uri.https('api.coingecko.com', '/api/v3/simple/price', {'ids': 'bitcoin,ethereum,dogecoin,binancecoin,ripple', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        json.keys.forEach((element) {
          myList.putIfAbsent(element, () => json[element]['huf']);
        });
        return myList;
      } else {
        throw Exception('Failed to get http');
      }
    } finally {
      client.close();
    }
  }

  Future<String> getMarketsForCoin(String coin) async{
    var client = http.Client();
    try {
      final Map<String, double> myList = new Map();
      var url =
      Uri.https('api.coingecko.com', '/api/v3/coins/markets', {'ids': coin, 'vs_currency': 'HUF'});
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

  Future<String> getLatestBitCoinPrices() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price', {'ids': 'bitcoin', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestEthereumPrices() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price', {'ids': 'ethereum', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestDogeCoinPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price', {'ids': 'dogecoin', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestBinanceCoinPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price', {'ids': 'binancecoin', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestTetherPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price', {'ids': 'tether', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestXrpPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price', {'ids': 'ripple', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }
}
