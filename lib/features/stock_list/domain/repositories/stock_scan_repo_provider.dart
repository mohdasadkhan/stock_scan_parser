import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/data/data.dart';
import 'package:stock_scan_parser/features/stock_list/domain/repositories/stock_scan_repo.dart';

final stockScanRepositoryProvider =
    Provider.autoDispose<StockScanRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final remoteDataSource = ref.watch(stackScanDataSourceProvider(httpClient));
  final networkInfo = ref.watch(networkInfoProvider);
  return StockScanRepositoryImpl(
    stockScanDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});
