import 'package:http/http.dart' as http;

class CoinPricesService {

  Future<String> getLatestBitCoinPrices() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price',
          {'ids': 'bitcoin', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestEthereumPrices() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price',
          {'ids': 'ethereum', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestDogeCoinPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price',
          {'ids': 'dogecoin', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestBinanceCoinPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price',
          {'ids': 'binancecoin', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestTetherPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price',
          {'ids': 'tether', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }

  Future<String> getLatestXrpPrice() async {
    var client = http.Client();
    try {
      var url = Uri.https('api.coingecko.com', '/api/v3/simple/price',
          {'ids': 'ripple', 'vs_currencies': 'HUF'});
      var response = await client.get(url);
      return response.body;
    } finally {
      client.close();
    }
  }


}