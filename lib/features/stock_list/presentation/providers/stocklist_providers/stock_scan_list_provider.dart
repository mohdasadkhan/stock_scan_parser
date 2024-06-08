import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_scan_parser/features/stock_list/domain/stock_scan_list/stock_scan_list.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/providers/providers.dart';

final listStockScanProvider =
    StateNotifierProvider<ListStockScanNotifier, ListStockScanState>((ref) {
  final getListStockScan = ref.read(getListStockScanProvider);
  return ListStockScanNotifier(getListStockScan);
});
