abstract class StockScanHttpClient {
  Future<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
