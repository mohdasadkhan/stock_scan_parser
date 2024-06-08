import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_scan_parser/features/stock_list/domain/stock_scan_list/stock_scan_list.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/providers/providers.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/utils/helpers.dart';

import 'stock_list_providers.dart';

class ListStockScanNotifier extends StateNotifier<ListStockScanState> {
  ListStockScanNotifier(this._stockScanList)
      : super(const ListStockScanState(isLoading: false)) {
    fetchListStockScan();
  }

  final GetListOfStockScan _stockScanList;

  Future<void> fetchListStockScan() async {
    state = const ListStockScanState(isLoading: true);
    final result = await _stockScanList();
    state = result.fold(
      (failure) => ListStockScanState(
        isLoading: false,
        errorMessage: Helpers.failureToMessage(failure),
      ),
      (listStockScan) => ListStockScanState(
        stockScanList: listStockScan,
        isLoading: false,
      ),
    );
  }
}
