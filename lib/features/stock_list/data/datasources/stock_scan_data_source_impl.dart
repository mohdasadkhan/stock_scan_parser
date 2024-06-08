import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/data/http/http.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/utils/utils.dart';

import 'stock_scan_data_source.dart';

class StockScanDataSourceImpl implements StockScanDataSource {
  final StockScanHttpClient httpClient;

  StockScanDataSourceImpl({required this.httpClient});

  @override
  Future<ListStockScan> getListOfStockScan() async {
    return await httpClient.request(url: ApiUrls.stockScanParserBaseUrl);
  }
}
