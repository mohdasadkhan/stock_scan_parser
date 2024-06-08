import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_scan_parser/features/stock_list/data/datasources/datasources.dart';
import 'package:stock_scan_parser/features/stock_list/data/http/http.dart';

final stackScanDataSourceProvider =
    Provider.family<StockScanDataSource, StockScanHttpClient>((_, httpClient) {
  return StockScanDataSourceImpl(httpClient: httpClient);
});
