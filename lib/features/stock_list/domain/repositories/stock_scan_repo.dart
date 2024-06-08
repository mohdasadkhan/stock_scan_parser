import 'package:dartz/dartz.dart';
import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/utils/types.dart';

abstract class StockScanRepository {
  Future<Either<Failure, ListStockScan>> getListOfStockScan();
}
