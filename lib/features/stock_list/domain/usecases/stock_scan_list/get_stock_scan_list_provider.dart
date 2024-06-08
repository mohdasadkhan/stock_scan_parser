import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_scan_parser/features/stock_list/domain/repositories/stock_scan_repo_provider.dart';
import 'package:stock_scan_parser/features/stock_list/domain/usecases/stock_scan_list/stock_scan_list.dart';

final getListStockScanProvider = Provider<GetListOfStockScan>((ref) {
  final repository = ref.read(stockScanRepositoryProvider);
  return GetListOfStockScan(repository);
});
