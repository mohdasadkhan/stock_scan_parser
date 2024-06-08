import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:stock_scan_parser/features/stock_list/data/http/http.dart';

final httpClientProvider = Provider.autoDispose<StockScanHttpClient>((ref) {
  final client = http.Client();
  return UserHttpClientImpl.StockScanHttpClientImpl(client: client);
});
