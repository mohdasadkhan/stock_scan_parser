import 'package:dartz/dartz.dart';
import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/domain/repositories/stock_scan_repo.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/utils/types.dart';

class GetListOfStockScan {
  final StockScanRepository _stockScanRepository;

  GetListOfStockScan(this._stockScanRepository);

  Future<Either<Failure, ListStockScan>> call() async {
    return await _stockScanRepository.getListOfStockScan();
  }
}
