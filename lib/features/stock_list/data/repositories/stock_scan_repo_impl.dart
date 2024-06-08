import 'package:dartz/dartz.dart';
import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/data/datasources/datasources.dart';
import 'package:stock_scan_parser/features/stock_list/domain/repositories/stock_scan_repo.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/utils/types.dart';

class StockScanRepositoryImpl extends StockScanRepository {
  final StockScanDataSource stockScanDataSource;
  final NetworkInfo networkInfo;
  StockScanRepositoryImpl({
    required this.networkInfo,
    required this.stockScanDataSource,
  });

  @override
  Future<Either<Failure, ListStockScan>> getListOfStockScan() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final listStockScan = await stockScanDataSource.getListOfStockScan();
        return Right(listStockScan.toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(Offline());
    }
  }
}
