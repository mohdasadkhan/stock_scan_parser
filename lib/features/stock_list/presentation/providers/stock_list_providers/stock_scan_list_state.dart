import 'package:equatable/equatable.dart';

import 'package:stock_scan_parser/features/stock_list/domain/entities/stock_scan/stock_scan.dart';

class ListStockScanState extends Equatable {
  final List<StockScan>? stockScanList;
  final bool isLoading;
  final String? errorMessage;

  const ListStockScanState({
    this.stockScanList,
    this.errorMessage,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [stockScanList, isLoading, errorMessage];
}
