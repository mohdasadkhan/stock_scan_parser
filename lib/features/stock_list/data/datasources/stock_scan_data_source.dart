import 'package:stock_scan_parser/features/stock_list/presentation/utils/utils.dart';

abstract class StockScanDataSource {
  Future<ListStockScan> getListOfStockScan();
}
